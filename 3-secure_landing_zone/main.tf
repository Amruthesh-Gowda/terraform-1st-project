/* 
Owner: 66degrees
Author: Bishwajeet Biswas and Arun Kumar
Version: 0.0.1
*/


/* -------------------------------------------------------------------------- */
/*                              Folder Structure                              */
/* -------------------------------------------------------------------------- */

module "org_folders" {
  source = "../modules/gcp-folder"
  parent = var.org_id
  names = var.org_folders
}

/* -------------------------------------------------------------------------- */
/*                             Subfolder Structure                            */
/* -------------------------------------------------------------------------- */

module "shared_folder" {
  source = "../modules/gcp-folder"
  parent = module.org_folders.folders_map["shared"].id
  names = var.subFolders["shared_folders"]
}

module "shared_nested" {
  source = "../modules/gcp-folder"
  parent = module.shared_folder.folders_map["bu-1-core"].id
  names = var.subFolders["shared_nested"]
}

module "bu-1-folder" {
  source = "../modules/gcp-folder"
  parent = module.org_folders.folders_map["bu-1-example"].id
  names = var.subFolders["bu_folders_nested"]
}

# #/* -------------------------------------------------------------------------- */
# #/*                         Host Projects                            */
# #/* -------------------------------------------------------------------------- */


module "prod_host_project" {
  source           = "../modules/host-project-factory"
  projectName      = var.projectName["prod_host"]
  networkName      = var.networkName["prod_vpc"]
  labels           = var.labels
  networkSubnets   = var.networkSubnets_prod
  vpc_connector = var.vpc_connector
  secondary_ranges = var.secondary_ranges_prod
  apis             = var.apis
  customRules     = var.firewall_prod
  routes          = var.routes
  folder_id       = module.shared_nested.folders_map["ex-1-p-core"].id
  billing_account = var.billing_account
  nat             = var.prod_nat
}

module "nonprod_host_project" {
  source           = "../modules/host-project-factory"
  projectName      = var.projectName["nonprod_host"]
  networkName      = var.networkName["nonprod_vpc"]
  labels           = var.labels
  networkSubnets   = var.networkSubnets_nonprod
  vpc_connector = var.vpc_connector
  secondary_ranges = var.secondary_ranges_nonprod
  apis             = var.apis
  customRules     = var.firewall_non_prod
  routes          = var.routes
  folder_id       = module.shared_nested.folders_map["ex-1-np-core"].id
  billing_account = var.billing_account
  nat             = var.nonprod_nat
}

# #/* -------------------------------------------------------------------------- */
# #/*                              Prod Service Projects                                */
# #/* -------------------------------------------------------------------------- */
module "production_project" {
  source            = "terraform-google-modules/project-factory/google"
  version           = "~> 10.3.2" //"10.3.2"
  depends_on        = [module.prod_host_project]
  name              = var.projectName["production"]
  random_project_id = true
  org_id            = var.org_id
  billing_account   = var.billing_account
  activate_apis     = var.apis
  project_sa_name   = "${var.projectName["production"]}-sa"
  sa_role           = var.sa_role
  folder_id         = module.bu-1-folder.folders_map["ex-1-prod"].id
  labels            = var.labels

  # Networking
  svpc_host_project_id = module.prod_host_project.project_id
}


# #/* -------------------------------------------------------------------------- */
# #/*                              Staging Service Projects                      */
# #/* -------------------------------------------------------------------------- */

module "staging_project" {
  source            = "terraform-google-modules/project-factory/google"
  version           = "~> 10.3.2"
  depends_on        = [module.nonprod_host_project]
  name              = var.projectName["stage"]
  random_project_id = true
  org_id            = var.org_id
  billing_account   = var.billing_account
  activate_apis     = var.apis
  project_sa_name   = "${var.projectName["stage"]}-sa"
  sa_role           = var.sa_role
  folder_id         = module.bu-1-folder.folders_map["ex-1-stage"].id
  labels            = var.labels

  # Networking
  svpc_host_project_id = module.nonprod_host_project.project_id
}


# #/* -------------------------------------------------------------------------- */
# #/*                          Development Service Projects                      */
# #/* -------------------------------------------------------------------------- */


module "dev_project" {
  source            = "terraform-google-modules/project-factory/google"
  version           = "~> 10.3.2"
  depends_on        = [module.nonprod_host_project]
  name              = var.projectName["dev"]
  random_project_id = true
  org_id            = var.org_id
  billing_account   = var.billing_account
  activate_apis     = var.apis
  project_sa_name   = "${var.projectName["stage"]}-sa"
  sa_role           = var.sa_role
  folder_id         = module.bu-1-folder.folders_map["ex-1-dev"].id
  labels            = var.labels

  # Networking
  svpc_host_project_id = module.nonprod_host_project.project_id
}


# #/* -------------------------------------------------------------------------- */
# #/*                          QA Service Projects                               */
# #/* -------------------------------------------------------------------------- */

module "qa_project" {
  source            = "terraform-google-modules/project-factory/google"
  version           = "~> 10.3.2"
  depends_on        = [module.nonprod_host_project]
  name              = var.projectName["qa"]
  random_project_id = true
  org_id            = var.org_id
  billing_account   = var.billing_account
  activate_apis     = var.apis
  project_sa_name   = "${var.projectName["stage"]}-sa"
  sa_role           = var.sa_role
  folder_id         = module.bu-1-folder.folders_map["ex-1-qa"].id
  labels            = var.labels

  # Networking
  svpc_host_project_id = module.nonprod_host_project.project_id
}
