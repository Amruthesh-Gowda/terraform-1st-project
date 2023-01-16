module "gcp_folders" {
  source  = "terraform-google-modules/folders/google"
  version = "3.0.0"

  parent = var.parent
  names  = var.names
}
