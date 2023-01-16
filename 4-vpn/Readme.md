# Using VPN module

```
vpn_config = {
  name           = "name-of-the-vpn"
  project_id     = "host project id"
  region         = "region"
  network        = "self link of host project vpc/network "
  az_ip_zero     = "VPN tunnel IP (1) from Azure"
  az_ip_one      = "VPN tunnel IP (2) from Azure"
  gcp_router_asn = ASN number configured in GCP side
  router_zero_config = {
    tunnel_zero_bgp_address = "169.254.21.2"    // using the following BGP Address
    tunnel_asn              = ASN number from Azure Side
    tunnel_zero_bgp_range   = "169.254.21.1/30" // using the following GBP address range 
  }
  router_one_config = {
    tunnel_one_bgp_address = "169.254.22.2" 
    tunnel_asn             = 65002
    tunnel_one_bgp_range   = "169.254.22.1/30"
  }
  shared_secret = "Shared secret should be same across GCP and Azure for this particular VPN"

}
```
