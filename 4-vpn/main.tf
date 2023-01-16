/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

module "ha_vpn" {
  source  = "terraform-google-modules/vpn/google//modules/vpn_ha"
  version = "~> 2.3.0"
  count   = var.vpn_config.create_vpn == true ? 1 : 0 
  name    = var.vpn_config.name
  project_id = var.vpn_config.project_id
  region     = var.vpn_config.region
  network    = var.vpn_config.network
  peer_external_gateway = {
    redundancy_type = "TWO_IPS_REDUNDANCY" //"SINGLE_IP_INTERNALLY_REDUNDANT"
    interfaces = [{
      id         = 0
      ip_address = var.vpn_config.az_ip_zero

      },
      {
        id         = 1
        ip_address = var.vpn_config.az_ip_one
      },
    ]
  }
  router_asn = var.vpn_config.gcp_router_asn
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = var.vpn_config.router_zero_config.tunnel_zero_bgp_address
        asn     = var.vpn_config.router_zero_config.tunnel_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = var.vpn_config.router_zero_config.tunnel_zero_bgp_range
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.vpn_config.shared_secret
    }
    remote-1 = {
      bgp_peer = {
        address = var.vpn_config.router_one_config.tunnel_one_bgp_address
        asn     = var.vpn_config.router_one_config.tunnel_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = var.vpn_config.router_one_config.tunnel_one_bgp_range 
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = 1
      shared_secret                   = var.vpn_config.shared_secret 
    }
  }
}