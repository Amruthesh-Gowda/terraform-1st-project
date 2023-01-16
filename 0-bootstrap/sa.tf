/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

locals {

  parent_type = var.parent_folder == "" ? "organization" : "folder"
  parent_id   = var.parent_folder == "" ? var.org_id : var.parent_folder

  granular_sa = var.granular_sa

  granular_sa_org_level_roles = var.granular_sa_org_level_roles

  granular_sa_parent_level_roles = var.granular_sa_parent_level_roles

  granular_sa_seed_project = var.granular_sa_seed_project
}

resource "google_service_account" "terraform-env-sa" {
  for_each = local.granular_sa

  project      = module.seed_bootstrap.seed_project_id
  account_id   = "terraform-${each.key}-sa"
  display_name = each.value
}

module "org_iam_member" {
  source   = "./modules/parent-iam-member"
  for_each = local.granular_sa_org_level_roles

  member      = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
  parent_type = "organization"
  parent_id   = var.org_id
  roles       = each.value
}

module "parent_iam_member" {
  source   = "./modules/parent-iam-member"
  for_each = local.granular_sa_parent_level_roles

  member      = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
  parent_type = local.parent_type
  parent_id   = local.parent_id
  roles       = each.value
}

module "project_iam_member" {
  source   = "./modules/parent-iam-member"
  for_each = local.granular_sa_seed_project

  member      = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
  parent_type = "project"
  parent_id   = module.seed_bootstrap.seed_project_id
  roles       = each.value
}

resource "google_billing_account_iam_member" "tf_billing_user" {
  for_each = local.granular_sa

  billing_account_id = var.billing_account
  role               = "roles/billing.user"
  member             = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"

  depends_on = [
    google_service_account.terraform-env-sa
  ]
}

resource "google_billing_account_iam_member" "billing_admin_user" {
  for_each = local.granular_sa

  billing_account_id = var.billing_account
  role               = "roles/billing.admin"
  member             = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"

  depends_on = [
    google_billing_account_iam_member.tf_billing_user
  ]
}

# resource "google_artifact_registry_repository_iam_member" "terraform_sa_artifact_registry_reader" {
#   for_each = local.granular_sa

#   project    = module.tf_source.cloudbuild_project_id
#   location   = var.default_region
#   repository = local.gar_repository
#   role       = "roles/artifactregistry.reader"
#   member     = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
# }

# resource "google_sourcerepo_repository_iam_member" "member" {
#   for_each = local.granular_sa

#   project    = module.tf_source.cloudbuild_project_id
#   repository = module.tf_source.csr_repos["gcp-policies"].name
#   role       = "roles/viewer"
#   member     = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
# }
