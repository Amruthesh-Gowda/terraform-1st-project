/* 
Owner: 66degrees
Author: Bishwajeet Biswas
Version: 0.0.1
*/

variable "vpn_config" {
  type = object({
    create_vpn     = bool
    name           = string
    project_id     = string
    region         = string
    network        = string
    az_ip_zero     = string
    az_ip_one      = string
    gcp_router_asn = number
    router_zero_config = object({
      tunnel_zero_bgp_address = string
      tunnel_asn              = number
      tunnel_zero_bgp_range   = string
    })
    router_one_config = object({
      tunnel_one_bgp_address = string
      tunnel_asn             = number
      tunnel_one_bgp_range   = string
    })
    shared_secret = string
  })

  # default = { }
}


# variable "vpn_config" {
#     type = map(object({
#         name        = string
#         project_id  = string
#         region      = string
#         network     = string
#         az_ip_zero  = string
#         az_ip_one   = string
#         gcp_router_asn  = number
#         router_zero_config = object({
#             tunnel_zero_bgp_address = string
#             tunnel_asn  = number
#             tunnel_zero_bgp_range = string
#         })
#         router_one_config = object({
#             tunnel_one_bgp_address = string
#             tunnel_asn  = number
#             tunnel_one_bgp_range = string            
#         })
#         shared_secret   = string
#     }))
#     default = {
#         dev_vpn = {
#             name    = "mt-np-vpn"
#             project_id  = "mt-hp-core-np"
#             region      = "us-east4"
#             network     = "projects/mt-hp-core-np/global/networks/mt-hp-vpc-np"
#             az_ip_zero  = "20.85.253.245"
#             az_ip_one   = "20.232.248.181"
#             gcp_router_asn = 65001
#             router_zero_config = {
#                 tunnel_zero_bgp_address     = "169.254.21.2"
#                 tunnel_asn                  = 65002
#                 tunnel_zero_bgp_range       = "169.254.21.1/30"
#             }
#             router_one_config   = {
#                 tunnel_one_bgp_address      = "169.254.22.2"
#                 tunnel_asn                  = 65002
#                 tunnel_one_bgp_range        = "169.254.22.1/30"
#             }
#             shared_secret                   = "SEMkSe9uvJrMC08JbCvY6mPbMlC8$nlz8tWOLW&UQE&d&"

#         }
#     }
# }