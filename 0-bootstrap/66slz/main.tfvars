/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

org_id = "270228063442" # format "000000000000"

billing_account = "01A26E-F5A54C-83E700" # format "000000-000000-000000"

folder_prefix  = "fldr"
project_prefix = "prj"

seed_project_name = "b-seed" // actual project name will be 'project_prefix'-'project_name'
cb_project_name = "prj-b-cicd-dvjr7oj8"

bucket_prefix        = "bkt"
state_bucket_name    = "b-tfstate" // actual state bucket name will be 'project_prefix'-'state_bucket_name'
bucket_force_destroy = false

org_policy_admin_role = false

parent_folder = ""

group_org_admins = "group_org_admins_local_test@66slz.com" // needs to be created by client / who have permission to create groups

group_billing_admins = "group_billing_admins_local_test@66slz.com" // needs to be created by client / who have permission to create groups


default_region = "us-central1"

// Optional - for an organization with existing projects or for development/validation.
// Uncomment this variable to place all the example foundation resources under
// the provided folder instead of the root organization.
// The variable value is the numeric folder ID
// The folder must already exist.
//parent_folder = "01234567890"

seed_project_labels = {
  "environment"       = "bootstrap"
  "application_name"  = "seed-bootstrap"
  "billing_code"      = "1234"
  "primary_contact"   = "example1"
  "secondary_contact" = "example2"
  "business_code"     = "abcd"
  "env_code"          = "b"
  "test"              = "morelabel"
}

seed_project_apis = [
  "serviceusage.googleapis.com",
  "servicenetworking.googleapis.com",
  "cloudkms.googleapis.com",
  "compute.googleapis.com",
  "logging.googleapis.com",
  "bigquery.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudbuild.googleapis.com",
  "iam.googleapis.com",
  "admin.googleapis.com",
  "appengine.googleapis.com",
  "storage-api.googleapis.com",
  "monitoring.googleapis.com",
  "pubsub.googleapis.com",
  "securitycenter.googleapis.com",
  "accesscontextmanager.googleapis.com",
  "billingbudgets.googleapis.com",
  "essentialcontacts.googleapis.com"
]

sa_org_sa_permissions = [
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

