/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

/********************************************************************
#  Optional - for enabling the automatic groups creation, uncoment the groups
#  variable and update the values with the desired group names
*********************************************************************/
groups = {
  create_groups   = true,
  billing_project = "project-test-billing-project",
  required_groups = {
    "group_org_admins"           = "group_org_admins_local_test_s@66slz.com"
    "group_billing_admins"       = "group_billing_admins_local_test_s@66slz.com"
    "shared_vpc_admins"          = "group_shared_vpc_admins@66slz.com"
    "billing_data_users"         = "billing_data_users_local_test@66slz.com"
    "audit_data_users"           = "audit_data_users_local_test@66slz.com"
    "monitoring_workspace_users" = "monitoring_workspace_users_local_test@66slz.com"
  },
  optional_groups = {
    "gcp_platform_viewer"      = "gcp_platform_viewer_local_test@66slz.com"
    "gcp_security_reviewer"    = "gcp_security_reviewer_local_test@66slz.com"
    "gcp_network_viewer"       = "gcp_network_viewer_local_test@66slz.com"
    "gcp_scc_admin"            = "gcp_scc_admin_local_test@66slz.com"
    "gcp_global_secrets_admin" = "gcp_global_secrets_admin_local_test@66slz.com"
    "gcp_audit_viewer"         = "gcp_audit_viewer_local_test@66slz.com"
    "gcp_folder_admin"         = "gcp_folder_admin_local_test@66slz.com"
  }
}


org_group_permissions = {
  "roles/resourcemanager.organizationAdmin" = "group:group_org_admins_local_test_s@66slz.com"
  "roles/billing.admin"                     = "group:group_billing_admins_local_test_s@66slz.com"
  "roles/billing.user"                      = "group:billing_data_users_local_test@66slz.com"
  "roles/viewer"                            = "group:audit_data_users_local_test@66slz.com"
  "roles/viewer"                            = "group:gcp_platform_viewer_local_test@66slz.com"
  "roles/viewer"                            = "group:gcp_audit_viewer_local_test@66slz.com"
  "roles/gsuiteaddons.developer"            = "group:monitoring_workspace_users_local_test@66slz.com"
  "roles/identityplatform.viewer"           = "group:gcp_security_reviewer_local_test@66slz.com"
  "roles/iam.securityReviewer"              = "group:gcp_security_reviewer_local_test@66slz.com"
  "roles/compute.networkViewer"             = "group:gcp_network_viewer_local_test@66slz.com"
  "roles/securitycenter.admin"              = "group:gcp_scc_admin_local_test@66slz.com"
  "roles/securitycenter.admin"              = "group:gcp_security_reviewer_local_test@66slz.com"
  "roles/secretmanager.admin"               = "group:gcp_global_secrets_admin_local_test@66slz.com"
  "roles/compute.xpnAdmin"                  = "group:group_shared_vpc_admins@66slz.com"
}
  