/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

variable "org_policy" {
  type = map(object({
    constraint       = string
    policy_type      = string
    organization_id  = string
    enforce          = bool
    policy_for       = string
    folder_id        = string
    project_id       = string
    exclude_folders  = set(string)
    exclude_projects = set(string)
  }))
  default = {}
}

