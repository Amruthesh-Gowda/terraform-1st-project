/* 
Owner: 66degrees
Author: Bishwajeet Biswas and Arun Kumar
Version: 0.0.1
*/

# --------------------------------------------------------------------------------------------------
# folder definitions
# --------------------------------------------------------------------------------------------------

org = "66slz.com"

billing_account = "01A26E-F5A54C-83E700"
org_id          = "organizations/270228063442"


org_folders           = ["shared", "bu-1-example"] # bu-1-{bu_name}
 subFolders = {
  shared_folders  = ["bu-1-core"]
  shared_nested   = ["ex-1-np-core", "ex-1-p-core"]
  bu_folders_nested = ["ex-1-dev", "ex-1-qa", "ex-1-stage", "ex-1-prod"]
}

# --------------------------------------------------------------------------------------------------
# project definitions
# --------------------------------------------------------------------------------------------------
projectName = {
  # Core-services Project
  nonprod_host = "ex-1-np-host"
  prod_host    = "ex-1-p-host"

  # Service Projects
  dev = "ex-1-dev-prj"
  qa = "ex-1-qa-prj"
  stage = "ex-1-stage-prj"
  production  = "ex-1-prod-prj"
}

labels = {
  owner = "66degrees"
}

# --------------------------------------------------------------------------------------------------
# common network definitions
# --------------------------------------------------------------------------------------------------
networkName = {
  nonprod_vpc = "slz-ex-np-vpc"
  prod_vpc    = "slz-ex-prod-vpc"
}

# --------------------------------------------------------------------------------------------------
# Additional Routes
# --------------------------------------------------------------------------------------------------

routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]

# --------------------------------------------------------------------------------------------------
# VPC Connector for server less services ( Cloud Run, Cloud Functions, App Engine) to access VPC Privately
# --------------------------------------------------------------------------------------------------

vpc_connector = {
    name  = "vpc-connector"
    machine_type = "e2-micro"
    max_throughput = 300
    ip_cidr_range = "10.10.0.0/28"
  }

# --------------------------------------------------------------------------------------------------
# Api's to enable in projects
# --------------------------------------------------------------------------------------------------

apis = [
  "compute.googleapis.com",
    "artifactregistry.googleapis.com",
    "oslogin.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudidentity.googleapis.com",
    "cloudshell.googleapis.com",
    "endpoints.googleapis.com",
    "gkeconnect.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "networkmanagement.googleapis.com",
    "stackdriver.googleapis.com",
    "storage-component.googleapis.com",
    "vpcaccess.googleapis.com",
]