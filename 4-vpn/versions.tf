/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

terraform {
  backend "gcs" {}
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google" {
}

provider "google-beta" {
}
