output "bigip_public_ip" {
  value       = nonsensitive(module.bigip-module_example_bigip_gcp_1nic_deploy.mgmtPublicIP)
  description = "BIGIP Public IP"
}

output "bigip_password" {
  value       = nonsensitive(module.bigip-module_example_bigip_gcp_1nic_deploy.bigip_password)
  description = "BIGIP Password"
}

output "bigip_instance_id" {
  value       = nonsensitive(module.bigip-module_example_bigip_gcp_1nic_deploy.bigip_instance_ids)
  description = "BIGIP Instance Id's"
}

output "bigip_private_addresses" {
  value       = nonsensitive(module.bigip-module_example_bigip_gcp_1nic_deploy.private_addresses)
  description = "BIGIP Private addresses"
}

output "bigip_public_addresses" {
  value       = nonsensitive(module.bigip-module_example_bigip_gcp_1nic_deploy.public_addresses)
  description = "BIGIP public addresses"
}