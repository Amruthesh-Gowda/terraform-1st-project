/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

vpn_config = {
  name           = "mt-np-vpn"
  project_id     = "mt-hp-core-np"
  region         = "us-east4"
  network        = "projects/mt-hp-core-np/global/networks/mt-hp-vpc-np"
  az_ip_zero     = "20.85.253.245" //20.232.248.181
  az_ip_one      = "20.232.248.181" //20.85.253.245
  gcp_router_asn = 65001
  router_zero_config = {
    tunnel_zero_bgp_address = "169.254.21.1"
    tunnel_asn              = 65002
    tunnel_zero_bgp_range   = "169.254.21.2/30"
  }
  router_one_config = {
    tunnel_one_bgp_address = "169.254.22.1"
    tunnel_asn             = 65002
    tunnel_one_bgp_range   = "169.254.22.2/30"
  }
  shared_secret = "SEMkSe9uvJrMC08JbCvY6mPbMlC8$nlz8tWOLW&UQE&d&"

}