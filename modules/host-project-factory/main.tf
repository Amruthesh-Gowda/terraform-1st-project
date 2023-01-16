/* -------------------------------------------------------------------------- */
/*                             Create the Projects                            */
/* -------------------------------------------------------------------------- */

module "host_project" {
  source                         = "terraform-google-modules/project-factory/google"
  version                        = "~> 10.3.2"
  name                           = var.projectName
  org_id                         = var.org_id
  billing_account                = var.billing_account
  bucket_versioning              = true
  activate_apis                  = var.apis
  folder_id                      = var.folder_id
  random_project_id              = false
  enable_shared_vpc_host_project = true
  labels                         = var.labels
}

module "host_network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2.0"

  project_id                             = module.host_project.project_id
  network_name                           = var.networkName
  routing_mode                           = "GLOBAL"
  auto_create_subnetworks                = false
  delete_default_internet_gateway_routes = false
  subnets                                = var.networkSubnets
  secondary_ranges                       = var.secondary_ranges

}

resource "google_compute_firewall" "custom" {
  for_each                = var.customRules
  name                    = each.key
  description             = each.value.description
  direction               = each.value.direction
  network                 = module.host_network.network_name
  project                 = module.host_project.project_id
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  source_tags             = each.value.use_service_accounts || each.value.direction == "EGRESS" ? null : each.value.sources
  source_service_accounts = each.value.use_service_accounts && each.value.direction == "INGRESS" ? each.value.sources : null
  target_tags             = each.value.use_service_accounts ? null : each.value.targets
  target_service_accounts = each.value.use_service_accounts ? each.value.targets : null
  disabled                = lookup(each.value.extra_attributes, "disabled", false)
  priority                = lookup(each.value.extra_attributes, "priority", 1000)

  dynamic "log_config" {
    for_each = lookup(each.value.extra_attributes, "flow_logs", true) ? [{
      metadata = lookup(each.value.extra_attributes, "flow_logs_metadata", "INCLUDE_ALL_METADATA")
    }] : []
    content {
      metadata = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "allow"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }

  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "deny"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }
}


module "routes" {
  source            = "terraform-google-modules/network/google//modules/routes"
  version           = "~> 5.2.0"
  module_depends_on = [module.host_network]
  project_id        = module.host_project.project_id
  network_name      = module.host_network.network_name

  routes = var.routes
}


/* -------------------------------------------------------------------------- */
/*                             Enable Nat on  Host Projects                                */
/* -------------------------------------------------------------------------- */

module "cloud-nat" {
  source = "../cloud-nat"
  project_id                         = module.host_project.project_id
  region                             = var.nat.nat_region //var.nat_region
  router                             = "${var.nat.nat_name}-rt"
  name                               = var.nat.nat_name //var.nat_name
  nat_ips                            = google_compute_address.nat.*.self_link
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  network                            = module.host_network.network_name
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetworks                        = var.subnetworks
}


resource "google_compute_address" "nat" {
  project       = module.host_project.project_id
  count         = 2
  address_type  = "EXTERNAL"
  name          = "${var.nat.nat_name}-${count.index}"
  region        = var.nat.nat_region
}


resource "google_vpc_access_connector" "dev_connector" {
  depends_on    = [module.host_network]
  name          = var.vpc_connector.name
  project       = module.host_project.project_id
  provider      = google-beta
  region        = var.nat.nat_region
  network       = module.host_network.network_name
  ip_cidr_range = var.vpc_connector.ip_cidr_range//"10.8.0.0/28"
  max_throughput= var.vpc_connector.max_throughput 
  machine_type = var.vpc_connector.machine_type
}