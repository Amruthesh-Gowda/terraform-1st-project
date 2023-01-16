/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/


locals {
  // terraform version image configuration
  terraform_version = var.terraform_version.version
  // The version of the terraform docker image to be used in the workspace builds
  docker_tag_version_terraform = var.terraform_version.docker_tag

  cb_source = var.gcp_vcs_repos

  cloud_source_repos = values(local.cb_source)
  cloudbuilder_repo  = "tf-cloudbuilder"
  base_cloud_source_repos = [
    "gcp-policies",
    "gcp-bootstrap",
    "gcp-iac",
    local.cloudbuilder_repo,
  ]
  gar_repository = split("/", module.tf_cloud_builder.artifact_repo)[length(split("/", module.tf_cloud_builder.artifact_repo)) - 1]
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

module "tf_source" {
  source  = "terraform-google-modules/bootstrap/google//modules/tf_cloudbuild_source"
  version = "~> 6.2"

  org_id                = var.org_id
  folder_id             = google_folder.bootstrap.id
  project_id            = var.cb_project_name #"${var.project_prefix}-b-cicd-${random_string.suffix.result}"
  billing_account       = var.billing_account
  group_org_admins      = local.group_org_admins
  buckets_force_destroy = var.bucket_force_destroy

  activate_apis = var.activate_apis_cicd_project

  cloud_source_repos = distinct(concat(local.base_cloud_source_repos, local.cloud_source_repos))

  project_labels = var.cb_project_labels

  # Remove after github.com/terraform-google-modules/terraform-google-bootstrap/issues/160
  depends_on = [module.seed_bootstrap]
}

module "tf_cloud_builder" {
  source  = "terraform-google-modules/bootstrap/google//modules/tf_cloudbuild_builder"
  version = "~> 6.2"

  project_id                   = module.tf_source.cloudbuild_project_id
  dockerfile_repo_uri          = module.tf_source.csr_repos[local.cloudbuilder_repo].url
  gar_repo_location            = var.default_region
  workflow_region              = var.default_region
  terraform_version            = local.terraform_version
  cb_logs_bucket_force_destroy = var.bucket_force_destroy
}


resource "google_service_account" "org_terraform" {
  project      = module.tf_source.cloudbuild_project_id
  account_id   = var.tf_sa_name
  display_name = var.tf_service_account_name
}

resource "google_organization_iam_member" "tf_sa_org_perms" {
  for_each = toset(var.sa_cb_org_iam_permissions)

  org_id = var.org_id
  role   = each.value
  member = "serviceAccount:${google_service_account.org_terraform.email}"
}

module "bootstrap_csr_repo" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 3.1.0"
  upgrade = false

  create_cmd_entrypoint = "${path.module}/scripts/push-to-repo.sh"
  create_cmd_body       = "${module.tf_source.cloudbuild_project_id} ${split("/", module.tf_source.csr_repos[local.cloudbuilder_repo].id)[3]} ${path.module}/Dockerfile"
}

resource "time_sleep" "cloud_builder" {
  create_duration = "30s"

  depends_on = [
    module.tf_cloud_builder,
    module.bootstrap_csr_repo,
  ]
}

module "build_terraform_image" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 3.1.0"
  upgrade = false

  create_cmd_triggers = {
    "terraform_version" = local.terraform_version
  }

  create_cmd_body = "beta builds triggers run ${split("/", module.tf_cloud_builder.cloudbuild_trigger_id)[3]} --branch main --project ${module.tf_source.cloudbuild_project_id}"

  module_depends_on = [
    time_sleep.cloud_builder,
  ]
}

# module "tf_workspace" {
#   source   = "terraform-google-modules/bootstrap/google//modules/tf_cloudbuild_workspace"
#   version  = "~> 6.2"
#   for_each = local.granular_sa

#   project_id                = module.tf_source.cloudbuild_project_id
#   location                  = var.default_region
#   state_bucket_self_link    = "${local.bucket_self_link_prefix}${module.seed_bootstrap.gcs_bucket_tfstate}"
#   cloudbuild_plan_filename  = "cloudbuild-tf-plan.yaml"
#   cloudbuild_apply_filename = "cloudbuild-tf-apply.yaml"
#   tf_repo_uri               = module.tf_source.csr_repos[local.cb_source[each.key]].url
#   cloudbuild_sa             = google_service_account.terraform-env-sa[each.key].id
#   create_cloudbuild_sa      = var.tf_workspace.create_cloudbuild_sa
#   diff_sa_project           = var.tf_workspace.diff_sa_project
#   create_state_bucket       = var.tf_workspace.create_state_bucket
#   buckets_force_destroy     = var.tf_workspace.bucket_force_destroy

#   substitutions = {
#     "_ORG_ID"                       = var.org_id
#     "_BILLING_ID"                   = var.billing_account
#     "_DEFAULT_REGION"               = var.default_region
#     "_GAR_REPOSITORY"               = local.gar_repository
#     "_DOCKER_TAG_VERSION_TERRAFORM" = local.docker_tag_version_terraform
#   }

#   tf_apply_branches = ["development", "non\\-production", "production"]

#   depends_on = [
#     module.tf_source,
#     module.tf_cloud_builder,
#   ]

# }

/*-------------------------
   IAM for cloud build project 
-----------------------------*/

resource "google_artifact_registry_repository_iam_member" "terraform_sa_artifact_registry_reader" {
  for_each = local.granular_sa

  project    = module.tf_source.cloudbuild_project_id
  location   = var.default_region
  repository = local.gar_repository
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
}

resource "google_sourcerepo_repository_iam_member" "member" {
  for_each = local.granular_sa

  project    = module.tf_source.cloudbuild_project_id
  repository = module.tf_source.csr_repos["gcp-policies"].name
  role       = "roles/viewer"
  member     = "serviceAccount:${google_service_account.terraform-env-sa[each.key].email}"
}