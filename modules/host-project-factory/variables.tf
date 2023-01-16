variable "projectName" {
  type = string
}

variable "org_id" {
  type    = string
  default = "669998275380"
}

variable "networkName" {
  type = string
}

variable "folder_id" {
  type = string
}


variable "networkSubnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "vpc_connector" {
  type    = object({
    name    = string
    machine_type = string
    max_throughput = number
    ip_cidr_range = string
  })
  default = {
    name  = "vpc-connector"
    machine_type = "e2-micro"
    max_throughput = 300
    ip_cidr_range = "10.8.0.0/28"
  }
}

# variable "vpc_connector_Subnet" {
#   type = string
#   description = "the name of the subnet where vpc connector is going to connect"
# }

variable "secondary_ranges" {
  type = map(
    list(
      object(
        {
          ip_cidr_range = string
          range_name    = string
        }
      )
    )
  )
  description = "Define the list of secondary Ranges"
  default = {
    app = [
      # {
      #   range_name = "test"
      #   ip_cidr_range = "10.0.0.0/24"
      # },
      # {
      #   range_name = "test2"
      #   ip_cidr_range = "10.2.9.0/24"
      # }
    ]
  }

}

variable "labels" {
  type = map(any)
}

variable "billing_account" {
  type = string
}

variable "apis" {
  type        = list(string)
  description = "List of apis to enable inside of the project during creation"
  default = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "oslogin.googleapis.com",
    "privateca.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
  ]
}

variable "customRules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = {}
  type = map(object({
    description          = string
    direction            = string
    action               = string # (allow|deny)
    ranges               = list(string)
    sources              = list(string)
    targets              = list(string)
    use_service_accounts = bool
    rules = list(object({
      protocol = string
      ports    = list(string)
    }))
    extra_attributes = map(string)
  }))
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

# NAT

variable "nat" {
  type    = object({
    # nat_needed  = bool
    nat_name    = string
    nat_region  = string
  })
  default   = {
    nat_name    = "mt-nat"
    nat_region  = "us-east4"
  }
}



variable "nat_ips" {
  description = "List of self_links of external IPs. Changing this forces a new NAT to be created."
  type        = list(string)
  default     = []
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "(Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created."
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "subnetworks" {
  type = list(object({
    name                     = string,
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
  default = []
}