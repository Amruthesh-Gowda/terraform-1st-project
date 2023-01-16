/* 
Owner: 66degrees
Author: Bishwajeet Biswas and Arun Kumar
Version: 0.0.1
*/

# --------------------------------------------------------------------------------------------------
# network definitions for non-prod subnets
# --------------------------------------------------------------------------------------------------
networkSubnets_nonprod = [
  {
    subnet_name                = "slz-ex-us-cen1-stage-subnet"
    subnet_ip                  = "10.150.128.0/17"
    subnet_region              = "us-central1"
    subnet_private_access      = "true"
    subnet_flow_logs           = "true"
    private_ipv6_google_access = "true"
    description                = "Management subnet"
    subnet_flow_logs_interval  = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling  = 0.7
    private_ip_google_access   = "true"
    subnet_private_access      = "true"
    subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
  },
  {
    subnet_name                = "slz-ex-us-cen1-dev-subnet"
    subnet_ip                  = "10.160.128.0/17"
    subnet_region              = "us-central1"
    subnet_private_access      = "true"
    subnet_flow_logs           = "true"
    private_ipv6_google_access = "true"
    description                = "Management subnet"
    subnet_flow_logs_interval  = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling  = 0.7
    private_ip_google_access   = "true"
    subnet_private_access      = "true"
    subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
  },
  {
    subnet_name                = "slz-ex-us-cen1-qa-subnet"
    subnet_ip                  = "10.170.128.0/17"
    subnet_region              = "us-central1"
    subnet_private_access      = "true"
    subnet_flow_logs           = "true"
    private_ipv6_google_access = "true"
    description                = "Management subnet"
    subnet_flow_logs_interval  = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling  = 0.7
    private_ip_google_access   = "true"
    subnet_private_access      = "true"
    subnet_flow_logs_metadata  = "INCLUDE_ALL_METADATA"
  }
]

secondary_ranges_nonprod = {
  slz-ex-us-cen1-stage-subnet = [
    {
      range_name    = "gke-pod-range"
      ip_cidr_range = "10.6.0.0/16"
    },
    {
      range_name    = "gke-service-range-01"
      ip_cidr_range = "10.150.0.0/22"
    },
    {
      range_name    = "gke-service-range-02"
      ip_cidr_range = "10.150.4.0/22"
    }
  ]
  slz-ex-us-cen1-dev-subnet = [
    {
      range_name    = "gke-pod-range"
      ip_cidr_range = "10.7.0.0/16"
    },
    {
      range_name    = "gke-service-range-01"
      ip_cidr_range = "10.160.0.0/22"
    },
    {
      range_name    = "gke-service-range-02"
      ip_cidr_range = "10.160.4.0/22"
    }
  ],
  slz-ex-us-cen1-qa-subnet = [
    {
      range_name    = "gke-pod-range"
      ip_cidr_range = "10.8.0.0/16"
    },
    {
      range_name    = "gke-service-range-01"
      ip_cidr_range = "10.170.0.0/22"
    },
    {
      range_name    = "gke-service-range-02"
      ip_cidr_range = "10.170.4.0/22"
    }
  ]
}

nonprod_nat = {
  nat_name   = "slz-ex-us-cen1-np-nat"
  nat_region = "us-central1"
}

# --------------------------------------------------------------------------------------------------
# firewall rule definitions Non-Prod
# --------------------------------------------------------------------------------------------------

firewall_non_prod = {
  internal-subnets = {
    description          = "Internal"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["10.150.128.0/17", "10.6.0.0/16", "10.150.0.0/22", "10.150.4.0/22"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-lb-healthcheck = {
    description          = "GCP Health Check Probes"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["35.191.0.0/16", "209.85.152.0/22", "209.85.204.0/22", "130.211.0.0/22"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "all"
        ports    = []
      },
    ]
    extra_attributes = {}
  },
  gcp-iap-desktop = {
    description          = "GCP IAP Check Probes"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["35.235.240.0/20"]
    sources              = []
    targets              = []
    use_service_accounts = false
    rules = [
      {
        protocol = "tcp"
        ports    = ["3389", "22"]
      },
    ]
    extra_attributes = {}
  }
}
