variable "gitlab_url" {
  type    = string
  default = "https://gitlab.com"
}

variable "gitlab_project_id" {
  type        = string
  description = "Project ID to restrict authentication from."
  default = "29663220"
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


variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)"
  default = {
    "google.subject"           = "assertion.sub", # Required
    "attribute.aud"            = "assertion.aud",
    "attribute.project_path"   = "assertion.project_path",
    "attribute.project_id"     = "assertion.project_id",
    "attribute.namespace_id"   = "assertion.namespace_id",
    "attribute.namespace_path" = "assertion.namespace_path",
    "attribute.user_email"     = "assertion.user_email",
    "attribute.ref"            = "assertion.ref",
    "attribute.ref_type"       = "assertion.ref_type",
    "attribute.repository"     = "assertion.repository"
  }
}

variable "allowed_audiences" {
  type        = list(string)
  description = "Workload Identity Pool Provider allowed audiences."
  default     = []
}