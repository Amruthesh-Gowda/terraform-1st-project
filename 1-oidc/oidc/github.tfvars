/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

/************ Github Section ***************
********************************************/

if_vcs_is_github = true
project_id = "prj-b-seed-22db"

github_pool_name  = "66d-tf-gh-pool"

github_provider_name = "66d-tf-gh-provider"

sa_mapping = {
    "tf-service-account" = {
      sa_name   = "projects/prj-b-seed-22db/serviceAccounts/org-terraform@prj-b-seed-22db.iam.gserviceaccount.com"
      attribute = "attribute.repository/66degrees/66d-slz"
    },
    "slz-lite-repo" = {
      sa_name   = "projects/prj-b-seed-22db/serviceAccounts/org-terraform@prj-b-seed-22db.iam.gserviceaccount.com"
      attribute = "attribute.repository/66degrees/66d-slz-lite"
    },
    "premium" = {
      sa_name   = "projects/prj-b-seed-22db/serviceAccounts/org-terraform@prj-b-seed-22db.iam.gserviceaccount.com"
      attribute = "attribute.repository/66degrees/66d-slz-premium"
    },
  }
