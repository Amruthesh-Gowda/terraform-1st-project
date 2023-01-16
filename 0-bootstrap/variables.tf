/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate projects with."
  type        = string
}

variable "group_org_admins" {
  description = "Google Group for GCP Organization Administrators"
  type        = string
}

variable "group_billing_admins" {
  description = "Google Group for GCP Billing Administrators"
  type        = string
}

variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist."
  type        = string
  default     = ""
}

variable "org_project_creators" {
  description = "Additional list of members to have project creator role across the organization. Prefix of group: user: or serviceAccount: is required."
  type        = list(string)
  default     = []
}

variable "org_policy_admin_role" {
  description = "Additional Org Policy Admin role for admin group. You can use this for testing purposes."
  type        = bool
  default     = false
}

variable "project_prefix" {
  description = "Name prefix to use for projects created. Should be the same in all steps. Max size is 3 characters."
  type        = string
  default     = "prj"
}

variable "folder_prefix" {
  description = "Name prefix to use for folders created. Should be the same in all steps."
  type        = string
  default     = "fldr"
}

variable "bucket_prefix" {
  description = "Name prefix to use for state bucket created."
  type        = string
  default     = "bkt"
}

variable "bucket_force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects."
  type        = bool
  default     = false
}

/* -------------------------------
    Variables specific for cloudbuild or cb.tf 
  --------------------------------*/
variable "cb_project_name" {
  type = string
  description = "cloud builder project name"
}
  
variable "tf_sa_name" {
  type        = string
  description = "Service account name, that you'll be using it for running the cloud build triggers"
  default     = "66slz0-sa-org-tf"
}

variable "tf_service_account_name" {
  type    = string
  default = "TF Account created and managed by TF. Used for Running Triggers"
}

variable "sa_cb_org_iam_permissions" {
  description = "List of permissions granted to Terraform service account across the GCP organization."
  type        = list(string)
  default = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.folderAdmin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/resourcemanager.organizationViewer"
  ]
}

variable "terraform_version" {
  type = object({
    version    = string
    docker_tag = string
  })
  default = {
    version    = "1.2.9"
    docker_tag = "latest"
  }
}

variable "gcp_vcs_repos" {
  type = map(string)
  default = {
    "org"  = "gcp-org",
    "env"  = "gcp-environments",
    "net"  = "gcp-networks",
    "proj" = "gcp-projects",
  }
}

variable "cb_project_labels" {
  type = map(string)
  default = {
    "environment"       = "bootstrap"
    "application_name"  = "cloudbuild-bootstrap"
    "billing_code"      = "1234"
    "primary_contact"   = "example1"
    "secondary_contact" = "example2"
    "business_code"     = "abcd"
    "env_code"          = "b"
  }
}

variable "tf_workspace" {
  type = object({
    create_cloudbuild_sa = bool
    diff_sa_project      = bool
    create_state_bucket  = bool
    bucket_force_destroy = bool
  })
  default = {
    create_cloudbuild_sa = false
    diff_sa_project      = true
    create_state_bucket  = false
    bucket_force_destroy = false
  }
}

variable "activate_apis_cicd_project" {
  type = list(string)
  default = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "sourcerepo.googleapis.com",
    "workflows.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudscheduler.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "billingbudgets.googleapis.com",
  ]
}


/* -----------------------------------------------
    Variables specific for seed project of main.tf 
  -----------------------------------------------*/

variable "seed_project_name" {
  type        = string
  default     = "b-seed"
  description = "seed project name starts with 'project_prefix'-'project_name'"
}

variable "state_bucket_name" {
  type        = string
  default     = "b-tfstate"
  description = "state bucket name starts with 'project_prefix'-'state_bucket_name' "
}

variable "seed_project_labels" {
  type = map(any)

  default = {
    "environment"       = "bootstrap"
    "application_name"  = "seed-bootstrap"
    "billing_code"      = "1234"
    "primary_contact"   = "example1"
    "secondary_contact" = "example2"
    "business_code"     = "abcd"
    "env_code"          = "b"
    "test"              = "morelabel"
  }
}

variable "seed_project_apis" {
  type = list(string)
  default = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "cloudkms.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "securitycenter.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "billingbudgets.googleapis.com",
    "essentialcontacts.googleapis.com"
  ]
}


variable "sa_org_sa_permissions" {
  type = list(string)
  default = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.folderAdmin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/resourcemanager.organizationViewer"
  ]
}

/* ----------------------------------------
    Specific to service accounts sa.tf 
   ---------------------------------------- */

variable "granular_sa" {
  type = map(any)
  default = {
    "org"  = "Foundation Organization SA. Managed by Terraform.",
    "env"  = "Foundation Environment SA. Managed by Terraform.",
    "net"  = "Foundation Network SA. Managed by Terraform.",
    "proj" = "Foundation Projects SA. Managed by Terraform.",
  }
}

variable "granular_sa_org_level_roles" {
  type = map(list(string))
  default = {
    "org" = [
      "roles/orgpolicy.policyAdmin",
      "roles/logging.configWriter",
      "roles/resourcemanager.organizationAdmin",
      "roles/securitycenter.notificationConfigEditor",
      "roles/resourcemanager.organizationViewer",
      "roles/accesscontextmanager.policyAdmin",
      "roles/essentialcontacts.admin",
    ],
    "net" = [
      "roles/accesscontextmanager.policyAdmin",
      "roles/compute.xpnAdmin",
    ],
    "proj" = [
      "roles/accesscontextmanager.policyAdmin",
      "roles/serviceusage.serviceUsageConsumer"
    ],
  }
}

variable "granular_sa_parent_level_roles" {
  type = map(list(string))
  default = {
    "org" = [
      "roles/resourcemanager.folderAdmin",
    ],
    "env" = [
      "roles/resourcemanager.folderAdmin"
    ],
    "net" = [
      "roles/resourcemanager.folderViewer",
      "roles/compute.networkAdmin",
      "roles/compute.securityAdmin",
      "roles/compute.orgSecurityPolicyAdmin",
      "roles/compute.orgSecurityResourceAdmin",
      "roles/dns.admin",
    ],
    "proj" = [
      "roles/resourcemanager.folderViewer",
      "roles/resourcemanager.folderIamAdmin",
      "roles/compute.networkAdmin",
      "roles/compute.xpnAdmin",
    ],
  }
}


variable "granular_sa_seed_project" {
  type = map(list(string))
  default = {
    "org" = [
      "roles/storage.objectAdmin",
    ],
    "env" = [
      "roles/storage.objectAdmin"
    ],
    "net" = [
      "roles/storage.objectAdmin",
    ],
    "proj" = [
      "roles/storage.objectAdmin",
    ],
  }
}


/* ----------------------------------------
    Specific to Groups creation
   ---------------------------------------- */

variable "groups" {
  description = "Contain the details of the Groups to be created."
  type = object({
    create_groups   = bool
    billing_project = string
    required_groups = map(any)
    optional_groups = map(any)
  })
  default = {
    create_groups   = false
    billing_project = ""
    required_groups = {}
    optional_groups = {}
  }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.billing_project != "" ? true : false) : true
  #   error_message = "A billing_project must be passed to use the automatic group creation."
  # }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.required_groups.group_org_admins != "" ? true : false) : true
  #   error_message = "The group group_org_admins is invalid, it must be a valid email."
  # }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.required_groups.group_billing_admins != "" ? true : false) : true
  #   error_message = "The group group_billing_admins is invalid, it must be a valid email."
  # }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.required_groups.billing_data_users != "" ? true : false) : true
  #   error_message = "The group billing_data_users is invalid, it must be a valid email."
  # }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.required_groups.audit_data_users != "" ? true : false) : true
  #   error_message = "The group audit_data_users is invalid, it must be a valid email."
  # }

  # validation {
  #   condition     = var.groups.create_groups == true ? (var.groups.required_groups.monitoring_workspace_users != "" ? true : false) : true
  #   error_message = "The group monitoring_workspace_users is invalid, it must be a valid email."
  # }

}

variable "initial_group_config" {
  description = "Define the group configuration when it are initialized. Valid values are: WITH_INITIAL_OWNER, EMPTY and INITIAL_GROUP_CONFIG_UNSPECIFIED."
  type        = string
  default     = "WITH_INITIAL_OWNER" #"EMPTY" # "INITIAL_GROUP_CONFIG_UNSPECIFIED"
}


variable "org_group_permissions" {
  type = map(any)

  default = {}
}