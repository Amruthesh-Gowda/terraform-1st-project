/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      // version 4.31.0 removed because of issue https://github.com/hashicorp/terraform-provider-google/issues/12226
      source  = "hashicorp/google"
      version = ">= 3.50, != 4.31.0"
    }

  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-example-foundation:bootstrap/v2.3.1"
  }

}


provider "google" {

}


provider "google-beta" {
  user_project_override = true
  billing_project       = var.groups.billing_project
}
