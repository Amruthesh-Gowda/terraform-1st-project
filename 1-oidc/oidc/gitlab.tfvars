/* 
Owner: 66degrees
Author: Bishwajeet Biswas
*/

/************ Gitlab Section ***************
********************************************/

if_vcs_is_gitlab = true

gcp_project_name = "prj-b-seed-22db"
region          = "us-central1"

gcp_pool_name = "66d-gitlab-pool"

gcp_provider_name = "66d-gitlab-provider"

gitlab_project_id = "29663220"

gitlab_namespace_path = ""

gitlab_repo = "bishwajeet.biswas1/terraform" # could be 66dslz/terraform <organization name>/<repository>

gitlab_url = "https://gitlab.com"

attribute_mapping = {
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

  service_account = "org-terraform-gitlab-prj-b-see@prj-b-seed-22db.iam.gserviceaccount.com"
