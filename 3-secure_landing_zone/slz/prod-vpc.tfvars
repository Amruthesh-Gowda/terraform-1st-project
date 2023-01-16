/* 
Owner: 66degrees
Author: Bishwajeet Biswas and Arun Kumar
Version: 0.0.1
*/

# --------------------------------------------------------------------------------------------------
# network definitions for prod subnets
# --------------------------------------------------------------------------------------------------

networkSubnets_prod = [
  {
    subnet_name                = "slz-ex-us-cen1-prod-subnet"
    subnet_ip                  = "10.128.128.0/17"
    subnet_region              = "us-central1"
    subnet_private_access      = "true"
    subnet_flow_logs           = "true"
    private_ipv6_google_access = "true"
    description                = "Management subnet"
    subnet_flow_logs_interval  = "INTERVAL_10_MIN"
    private_ip_google_access   = "true"
    subnet_private_access      = "true"
    subnet_flow_logs_sampling  = 0.7
    subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
  }
]

secondary_ranges_prod = {
  slz-ex-us-cen1-prod-subnet = [
    {
      range_name    = "gke-pod-range"
      ip_cidr_range = "10.5.0.0/16"
    },
    {
      range_name    = "gke-service-range-01"
      ip_cidr_range = "10.128.0.0/22"
    },
    {
      range_name    = "gke-service-range-02"
      ip_cidr_range = "10.128.4.0/22"
    }
  ]
}

prod_nat = {
  nat_name   = "slz-ex-us-cen1-prod-nat"
  nat_region = "us-central1"
}

# --------------------------------------------------------------------------------------------------
# firewall rule definitions Prod
# --------------------------------------------------------------------------------------------------

firewall_prod = {
  internal = {
    description          = "Internal"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["10.128.128.0/17", "10.5.0.0/16", "10.128.0.0/22", "10.128.4.0/22"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-lb-healthcheck = {
    description          = "GCP Health Check Probes"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["35.191.0.0/16", "209.85.152.0/22", "209.85.204.0/22", "130.211.0.0/22"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-iap-desktop = {
    description          = "GCP IAP Check Probes"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["35.235.240.0/20"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "tcp"
        ports    = ["3389", "22"]
      },
    ]
    extra_attributes = {}
  },
}