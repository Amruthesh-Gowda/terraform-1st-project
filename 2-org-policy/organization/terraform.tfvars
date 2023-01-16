/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/


/* Below are 14 Org Policies, where you can set either Organization_id or Folder_id or Project_id */

org_policy  = {
  unfirom_bucket = {
    organization_id  = "270228063442"
    constraint = "constraints/storage.uniformBucketLevelAccess"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null
  },

  disable_healthcare_api_logging = {
    organization_id  = "270228063442"
    constraint = "constraints/gcp.disableCloudLogging"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null
  },
  disable_guest_attribute_access = {
    organization_id  = "270228063442"
    constraint = "constraints/compute.disableGuestAttributesAccess"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null    
  },

  disable_public_ip_on_cloudsql = {
    organization_id  = "270228063442"
    constraint       = "constraints/sql.restrictPublicIp"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null    
  },

  disable_sa_key_creation = { 
    organization_id  = "270228063442"
    constraint       = "constraints/iam.disableServiceAccountKeyCreation"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null     
  },
 disable_sa_key_upload = {
    organization_id  = "270228063442"
    constraint       = "constraints/iam.disableServiceAccountKeyUpload"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null  
 },
 disable_vm_nested_virtualization = {
    organization_id  = "270228063442"
    constraint       = "constraints/compute.disableNestedVirtualization"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null  
 },

 disable_serial_port_access = {
    organization_id  = "270228063442"
    constraint       = "constraints/compute.disableSerialPortAccess"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null    
 },
#  domain_restricted_sharing = {
#     organization_id  = "270228063442"
#     constraint       = "constraints/iam.allowedPolicyMemberDomains"
#     policy_type      = "boolean"
#     policy_for       = "organization"
#     enforce          = true
#     exclude_folders  = []
#     exclude_projects = []
#     folder_id       = null
#     project_id      = null  
#  },
 enforce_public_access_prevention = {
    organization_id  = "270228063442"
    constraint       = "constraints/storage.publicAccessPrevention"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null  
 },
 require_os_login = {
    organization_id  = "270228063442"
    constraint       = "constraints/compute.requireOsLogin"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null  
 },
 org_shared_vpc_lien_removal = {
    organization_id  = "270228063442"
    constraint       = "constraints/compute.restrictXpnProjectLienRemoval"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null  
 },
#  compute_vm_external_ip-access = {
#     organization_id  = "270228063442"
#     constraint       = "constraints/compute.vmExternalIpAccess"
#     policy_type      = "boolean"
#     policy_for       = "organization"
#     enforce          = true
#     exclude_folders  = []
#     exclude_projects = []
#     folder_id       = null
#     project_id      = null  
#  },
 compute_skip_default_network = {
    organization_id  = "270228063442"
    constraint       = "constraints/compute.skipDefaultNetworkCreation"
    policy_type      = "boolean"
    policy_for       = "organization"
    enforce          = true
    exclude_folders  = []
    exclude_projects = []
    folder_id       = null
    project_id      = null   
 }
}  
