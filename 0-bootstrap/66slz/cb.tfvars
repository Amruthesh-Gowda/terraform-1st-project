/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

terraform_version = {
  version    = "1.2.9"
  docker_tag = "latest"
}


gcp_vcs_repos = {
  "org"  = "gcp-org",
  "env"  = "gcp-environments",
  "net"  = "gcp-networks",
  "proj" = "gcp-projects",
}


cb_project_labels = {
  "environment"       = "bootstrap"
  "application_name"  = "cloudbuild-bootstrap"
  "billing_code"      = "1234"
  "primary_contact"   = "example1"
  "secondary_contact" = "example2"
  "business_code"     = "abcd"
  "env_code"          = "b"
}

tf_workspace = {
  create_cloudbuild_sa = false
  diff_sa_project      = true
  create_state_bucket  = false
  bucket_force_destroy = false
}

activate_apis_cicd_project = [
  "serviceusage.googleapis.com",
  "servicenetworking.googleapis.com",
  "compute.googleapis.com",
  "logging.googleapis.com",
  "iam.googleapis.com",
  "admin.googleapis.com",
  "sourcerepo.googleapis.com",
  "workflows.googleapis.com",
  "artifactregistry.googleapis.com",
  "cloudbuild.googleapis.com",
  "cloudscheduler.googleapis.com",
  "bigquery.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "cloudbilling.googleapis.com",
  "appengine.googleapis.com",
  "storage-api.googleapis.com",
  "billingbudgets.googleapis.com",
]


tf_sa_name = "tf-sa-org"

sa_cb_org_iam_permissions = [
  "roles/accesscontextmanager.policyAdmin",
  "roles/billing.user",
  "roles/compute.networkAdmin",
  "roles/compute.xpnAdmin",
  "roles/iam.securityAdmin",
  "roles/iam.serviceAccountAdmin",
  "roles/logging.configWriter",
  "roles/orgpolicy.policyAdmin",
  "roles/resourcemanager.projectCreator",
  "roles/resourcemanager.folderAdmin",
  "roles/securitycenter.notificationConfigEditor",
  "roles/resourcemanager.organizationViewer"
]