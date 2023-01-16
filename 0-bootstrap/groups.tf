/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

#Groups creation resources

locals {
  optional_groups_to_create = {
    for key, value in var.groups.optional_groups : key => value
    if value != "" && var.groups.create_groups == true
  }
  required_groups_to_create = {
    for key, value in var.groups.required_groups : key => value
    if var.groups.create_groups == true
  }

  org_group_permissions = {
    for key, value in var.org_group_permissions : key => value
    if var.groups.create_groups == true
  }
}

data "google_organization" "org" {
  count        = var.groups.create_groups ? 1 : 0
  organization = var.org_id
}

module "required_group" {
  for_each = local.required_groups_to_create
  source   = "terraform-google-modules/group/google"
  version  = "~> 0.1"

  id                   = each.value
  display_name         = each.key
  description          = each.key
  initial_group_config = var.initial_group_config
  customer_id          = data.google_organization.org[0].directory_customer_id
}

module "optional_group" {
  for_each = local.optional_groups_to_create
  source   = "terraform-google-modules/group/google"
  version  = "~> 0.1"

  id                   = each.value
  display_name         = each.key
  description          = each.key
  initial_group_config = var.initial_group_config
  customer_id          = data.google_organization.org[0].directory_customer_id
}


/************ Giving Permissions to groups *************
*******************************************************/


resource "google_organization_iam_member" "binding" {
  # depends_on = [google_organization.org]
  for_each = local.org_group_permissions
  # for_each = var.org_group_permissions
  org_id   = var.org_id
  role     = each.key   
  member   = each.value 
}
