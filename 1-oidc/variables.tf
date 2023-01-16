/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/


variable "if_vcs_is_github" {
   type = bool
   default = false
}

variable "project_id" {
  type        = string
  description = "The project id to create Workload Identity Pool"
  default = "mt-test-project-id"
}

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
  default = "mt-test"
}

variable "pool_display_name" {
  type        = string
  description = "Workload Identity Pool display name"
  default     = null
}

variable "pool_description" {
  type        = string
  description = "Workload Identity Pool description"
  default     = "Workload Identity Pool managed by Terraform"
}

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider id"
  default   = "mt-test-provider"
}

variable "issuer_uri" {
  type        = string
  description = "Workload Identity Pool Issuer URL"
  default     = "https://token.actions.githubusercontent.com"
}

variable "provider_display_name" {
  type        = string
  description = "Workload Identity Pool Provider display name"
  default     = null
}

variable "provider_description" {
  type        = string
  description = "Workload Identity Pool Provider description"
  default     = "Workload Identity Pool Provider managed by Terraform"
}

variable "attribute_condition" {
  type        = string
  description = "Workload Identity Pool Provider attribute condition expression. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_condition)"
  default     = null
}

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)"
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
}

variable "allowed_audiences" {
  type        = list(string)
  description = "Workload Identity Pool Provider allowed audiences."
  default     = []
}

variable "sa_mapping" {
  type = map(object({
    sa_name   = string
    attribute = string
  }))
  description = "Service Account resource names and corresponding WIF provider attributes. If attribute is set to `*` all identities in the pool are granted access to SAs."
  default     = {}
}

variable "github_pool_name" {
  type = string
}
 
variable "github_provider_name" {
  type = string
}

### variables for Gitlab ######

variable "if_vcs_is_gitlab" {
  type = bool
  default = "false"
}

variable "gitlab_url" {
  type    = string
  default = "https://gitlab.com"
}

variable "gitlab_project_id" {
  type        = string
  description = "Project ID to restrict authentication from."
  default = ""
}

variable "region" {
  type = string
}

variable "gcp_pool_name" {
  type = string
}

variable "service_account" {
  type = string
}

variable "gcp_provider_name" {
  type = string
}

variable "gitlab_namespace_path" {
  type        = string
  description = "Namespace Path to Filter Auth Requests"
  default = ""
}

variable "gcp_project_name" {
  type        = string
  description = "GCP Project name"
  default = "prj-b-seed-22db"
}

variable "gitlab_repo" {
  type  = string
  description = "Gitlab Repository Name eg., organization/repo_name or username/repo_name"
  default     = "bishwajeet.biswas1/terraform"
}


