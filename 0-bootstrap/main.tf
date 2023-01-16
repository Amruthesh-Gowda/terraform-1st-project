/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

/*************************************************
  Bootstrap GCP Organization.
*************************************************/
locals {
  // The bootstrap module will enforce that only identities
  // in the list "org_project_creators" will have the Project Creator role,
  // so the granular service accounts for each step need to be added to the list.
  step_terraform_sa = [
    "serviceAccount:${google_service_account.terraform-env-sa["org"].email}",
    "serviceAccount:${google_service_account.terraform-env-sa["env"].email}",
    "serviceAccount:${google_service_account.terraform-env-sa["net"].email}",
    "serviceAccount:${google_service_account.terraform-env-sa["proj"].email}",
  ]
  org_project_creators = distinct(concat(var.org_project_creators, local.step_terraform_sa))
  parent               = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${var.org_id}"
  org_admins_org_iam_permissions = var.org_policy_admin_role == true ? [
    "roles/orgpolicy.policyAdmin", "roles/resourcemanager.organizationAdmin", "roles/billing.user"
  ] : ["roles/resourcemanager.organizationAdmin", "roles/billing.user"]
  bucket_self_link_prefix = "https://www.googleapis.com/storage/v1/b/"
  group_org_admins        = var.groups.create_groups ? var.groups.required_groups.group_org_admins : var.group_org_admins
  group_billing_admins    = var.groups.create_groups ? var.groups.required_groups.group_billing_admins : var.group_billing_admins
}

resource "google_folder" "bootstrap" {
  display_name = "${var.folder_prefix}-bootstrap"
  parent       = local.parent
}

module "seed_bootstrap" {
  source                         = "terraform-google-modules/bootstrap/google"
  version                        = "~> 6.2"
  org_id                         = var.org_id
  folder_id                      = google_folder.bootstrap.id
  project_id                     = "${var.project_prefix}-${var.seed_project_name}"
  state_bucket_name              = "${var.bucket_prefix}-${var.state_bucket_name}"
  force_destroy                  = var.bucket_force_destroy
  billing_account                = var.billing_account
  group_org_admins               = local.group_org_admins
  group_billing_admins           = local.group_billing_admins
  default_region                 = var.default_region
  org_project_creators           = local.org_project_creators
  sa_enable_impersonation        = true
  parent_folder                  = var.parent_folder == "" ? "" : local.parent
  org_admins_org_iam_permissions = local.org_admins_org_iam_permissions
  project_prefix                 = var.project_prefix

  # Remove after github.com/terraform-google-modules/terraform-google-bootstrap/issues/160
  depends_on = [google_folder.bootstrap, module.required_group, module.optional_group]

  project_labels = var.seed_project_labels


  activate_apis = var.seed_project_apis


  sa_org_iam_permissions = var.sa_org_sa_permissions
}

