/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

/*********** Uncomment the below section************
****************************************************/

vpn_config = {
  create_vpn    = false
  name           = "ex-np-vpn"
  project_id     = "ex-1-np-host"
  region         = "us-central1"
  network        = "projects/ex-1-np-host/global/networks/slz-ex-np-vpc"
  az_ip_zero     = "20.85.253.245"
  az_ip_one      = "20.232.248.181"
  gcp_router_asn = 65001
  router_zero_config = {
    tunnel_zero_bgp_address = "169.254.21.2"
    tunnel_asn              = 65002
    tunnel_zero_bgp_range   = "169.254.21.1/30"
  }
  router_one_config = {
    tunnel_one_bgp_address = "169.254.22.2"
    tunnel_asn             = 65002
    tunnel_one_bgp_range   = "169.254.22.1/30"
  }
  shared_secret = "SEMkSe9uvJrMC08JbCvY6mPbMlC8$nlz8tWOLW&UQE&d&"
} 