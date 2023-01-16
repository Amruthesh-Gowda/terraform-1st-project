output "project_id" {
  value = module.host_project.project_id
}

output "subnet_id" {
  value = module.host_network.subnets_self_links
}

output "network_name" {
  value = module.host_network.network_name
}

output "subnet_Ids" {
  value = module.host_network.subnets
}

output "network_id" {
  value = module.host_network.network_id
}

output "network_self_link" {
  value = module.host_network.network_self_link
}
