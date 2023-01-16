# variable "constraint" {
#   type = string
# }

# variable "policy_type" {
#   type = string
# }

# variable "organization_id" {
#   type = string
# }

# variable "enforce" {
#   type = bool
# }

# variable "exclude_folders" {
#   description = "Set of folders to exclude from the policy"
#   type        = set(string)
#   default     = []
# }

# variable "exclude_projects" {
#   description = "Set of projects to exclude from the policy"
#   type        = set(string)
#   default     = []
# }


variable "org_policy" {
  type = map(object({
    constraint        = string
    policy_type       = string
    organization_id   = string
    enforce           = bool
    policy_for        = string
    folder_id         = string
    project_id        = string
    exclude_folders   = set(string)
    exclude_projects  = set(string)
  }))
  default             = {}
}

######
