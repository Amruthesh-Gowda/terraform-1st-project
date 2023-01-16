
module "org_policy" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 5.1.0"
  for_each        = var.org_policy
  constraint      = each.value.constraint
  policy_type     = each.value.policy_type
  organization_id = each.value.constraint != "project" && each.value.constraint != "folder" ? each.value.organization_id : null
  # organization_id = each.value.project_id == null  || each.value.folder_id == null ? each.value.organization_id : null
  enforce         = each.value.enforce
  policy_for      = each.value.policy_for
  # folder_id       = each.value.organization_id == null || each.value.project_id == null ? each.value.folder_id : null
  folder_id       = each.value.constraint != "project" && each.value.constraint != "organization" ? each.value.folder_id : null
  # project_id      = each.value.organization_id == null || each.value.folder_id == null ? each.value.project_id : null
  project_id      = each.value.constraint != "folder" && each.value.constraint != "organization" ? each.value.project_id : null
  exclude_folders  = each.value.exclude_folders
  exclude_projects = each.value.exclude_projects
}
