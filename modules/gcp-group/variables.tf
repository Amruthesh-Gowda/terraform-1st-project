variable "display_name" {
  type = string
}

variable "customer_id" {
  type = string
}

variable "group_email" {
  type = string
}

variable "roles" {
  type = list(string)
}

variable "org_group" {
  type    = bool
  default = false
}

variable "folder_group" {
  type    = bool
  default = false
}

variable "folder_id" {
  type    = string
  default = ""
}
