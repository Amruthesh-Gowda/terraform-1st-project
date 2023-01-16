/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/


/************ Github Section ***************
********************************************/
module "gh_oidc" {
  count     = var.if_vcs_is_github == true ? 1 : 0
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.project_id
  pool_id     = var.github_pool_name #"66d-tf-gh"
  provider_id = var.github_provider_name # "66d-provider"
  issuer_uri  = var.issuer_uri
  sa_mapping = var.sa_mapping
}

/************ Gitlab Section ***************
********************************************/

module "gitlab_oidc" {
  count     = var.if_vcs_is_gitlab == true ? 1 : 0
  source    = "../modules/gitlab-oidc/"
  gcp_project_name   = var.project_id
  region    = var.region
  gcp_pool_name    = var.gcp_pool_name
  gcp_provider_name   = var.gcp_provider_name
  gitlab_project_id   = var.gitlab_project_id
  gitlab_repo   = var.gitlab_repo
  gitlab_url   = var.gitlab_url
  attribute_mapping   = var.attribute_mapping
  service_account     = var.service_account
}