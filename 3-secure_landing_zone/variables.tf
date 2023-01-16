/* 
Owner: 66degrees
Author: Bishwajeet Biswas and Arun Kumar
Version: 0.0.1
*/


variable "org" {
  type    = string
}

variable "org_folders" {
  type = list(string)
}

variable "org_id" {
  type    = string
}

variable "subFolders" {
  type = map(list(string))
}

variable "projectName" {
  type = map(any)
}

variable "networkName" {
  type = map(any)
}

variable "labels" {
  type = map(any)
}

variable "billing_account" {
  type = string
}

variable "sa_role" {
  type = string
  default = "roles/editor"
}

variable "networkSubnets_nonprod" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "networkSubnets_prod" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges_nonprod" {
  type = map(list(object(
    {
      ip_cidr_range = string
      range_name    = string
    }
    )
    )
  )
  description = "Define the list of secondary Ranges"
}

variable "secondary_ranges_prod" {
  type = map(list(object(
    {
      ip_cidr_range = string
      range_name    = string
    }
    )
    )
  )
  description = "Define the list of secondary Ranges"
}

variable "vpc_connector" {
  type    = object({
    name    = string
    machine_type = string
    max_throughput = number
    ip_cidr_range = string
  })
}

variable "apis" {
  type        = list(string)
  description = "List of apis to enable inside of the project during creation"
  default = [
    "compute.googleapis.com",
    "artifactregistry.googleapis.com",
    "oslogin.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudidentity.googleapis.com",
    "cloudshell.googleapis.com",
    "endpoints.googleapis.com",
    "gkeconnect.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "networkmanagement.googleapis.com",
    "stackdriver.googleapis.com",
    "storage-component.googleapis.com",
    "vpcaccess.googleapis.com",
  ]
}

variable "firewall_prod" {
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

variable "firewall_non_prod" {
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
}

variable "prod_nat" {
  type = object({
    # nat_needed  = bool
    nat_name   = string
    nat_region = string
  })
}

variable "nonprod_nat" {
  type = object({
    # nat_needed  = bool
    nat_name   = string
    nat_region = string
  })
}