# Organization Policies

## List of Org Policies applied, 

| Name | Constraint |
|------|:------------:|
|unfirom_bucket| storage.uniformBucketLevelAccess |
| disable_healthcare_api_logging| constraints/gcp.disableCloudLogging |
|  disable_guest_attribute_access | compute.disableGuestAttributesAccess |
| disable_public_ip_on_cloudsql | sql.restrictPublicIp |
| disable_sa_key_creation |iam.disableServiceAccountKeyCreation |
| disable_sa_key_upload | iam.disableServiceAccountKeyUpload |
|  disable_vm_nested_virtualization | compute.disableNestedVirtualization |
|  disable_serial_port_access | compute.disableSerialPortAccess |
| domain_restricted_sharing (not applied) |iam.allowedPolicyMemberDomains |
| enforce_public_access_prevention | storage.publicAccessPrevention |
| require_os_login | compute.requireOsLogin |
| org_shared_vpc_lien_removal | compute.restrictXpnProjectLienRemoval |
| compute_vm_external_ip-access | compute.vmExternalIpAccess |
| compute_skip_default_network | compute.skipDefaultNetworkCreation |

#
# Below are detailed information 
This Terraform module allows you to set a `Uniform Bucket-level Access` [Organization Policy](https://cloud.google.com/storage/docs/uniform-bucket-level-access). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| exclude\_folders | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| exclude\_projects | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |


#
# Disable Cloud Logging for Healthcare API Module

This Terraform module allows you to `Disable Cloud Logging for the Healthcare API` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable Guest Attributes of Compute Engine Metadata Module

This Terraform module allows you to implement `Disable Guest Attributes Access` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on the organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable Public IP Address on CloudSQL Module

This Terraform module allows you to `Disable Public IP Address for CloudSQL` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable Service Account Key Creation Module

This Terraform module allows you to set a `Disable Service Account Creation` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable Service Account Key Upload Module

This Terraform module implements the `Disable Service Account Key Upload` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization or folder level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization` or `folder`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable VM Nested Virtualization Module

This Terraform module allows you to implement `Disable VM Nested Virtualization` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on the organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Disable VM Serial Port Access Module

This Terraform module allows you to set a `Disable VM Serial Port Access` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Domain Restricted Sharing Module

This Terraform module allows to set a `Domain Restricted Sharing` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/restricting-domains) for a list of domains. The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domains\_to\_allow | The list of domains to allow users from | `list(string)` | n/a | yes |
| exclude\_folders | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| exclude\_projects | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Restrict Public Access to Cloud Storage

This Terraform module implements the 'Enforce Public Access Prevention` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:| 
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

#
# Require OS Login for VMs on All Newly Created Projects Module

This Terraform module allows you to set an `Require OS Login` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied at the organization or folder level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization` or `folder`. | `string` | n/a | yes |

#
# Restrict Shared VPC Lien Removal Module

This Terraform module allows you to set a `Shared VPC Lien Removal Restriction` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied at the organization level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization` or `folder`. | `string` | n/a | yes |

#
# Restrict External IPs for VM instances Module

This Terraform module allows you to`Restrict External IPs for VM instances` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| exclude\_folders | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| exclude\_projects | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |
| vms\_to\_allow | The list of VMs are allowed to use external IP, every element of the list must be identified by the VM instance name, in the form: projects/PROJECT\_ID/zones/ZONE/instances/INSTANCE | `list(string)` | `[]` | no |

#
# Skip Default Network Creation Module

This Terraform module allows you to set a `Skip Default Network Creation` [Organization Policy](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints). The policy may be applied on organization, folder or project level.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| exclude\_folders | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| exclude\_projects | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| project\_id | The project id for putting the policy | `string` | `null` | no |

