/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

granular_sa = {
  "org"  = "Foundation Organization SA. Managed by Terraform.",
  "env"  = "Foundation Environment SA. Managed by Terraform.",
  "net"  = "Foundation Network SA. Managed by Terraform.",
  "proj" = "Foundation Projects SA. Managed by Terraform.",
}

granular_sa_org_level_roles = {
  "org" = [
    "roles/orgpolicy.policyAdmin",
    "roles/logging.configWriter",
    "roles/resourcemanager.organizationAdmin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/resourcemanager.organizationViewer",
    "roles/accesscontextmanager.policyAdmin",
    "roles/essentialcontacts.admin",
  ],
  "net" = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/compute.xpnAdmin",
  ],
  "proj" = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/serviceusage.serviceUsageConsumer"
  ],
}


granular_sa_parent_level_roles = {
  "org" = [
    "roles/resourcemanager.folderAdmin",
  ],
  "env" = [
    "roles/resourcemanager.folderAdmin"
  ],
  "net" = [
    "roles/resourcemanager.folderViewer",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/compute.orgSecurityPolicyAdmin",
    "roles/compute.orgSecurityResourceAdmin",
    "roles/dns.admin",
  ],
  "proj" = [
    "roles/resourcemanager.folderViewer",
    "roles/resourcemanager.folderIamAdmin",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
  ],
}

granular_sa_seed_project = {
  "org" = [
    "roles/storage.objectAdmin",
  ],
  "env" = [
    "roles/storage.objectAdmin"
  ],
  "net" = [
    "roles/storage.objectAdmin",
  ],
  "proj" = [
    "roles/storage.objectAdmin",
  ],
} 