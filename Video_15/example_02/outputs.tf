# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "tenant_id" {
  value = local.environments.shared.tenant_id
}

output "subscription_id" {
  value = local.subscription_id
}

output "location" {
  value = local.location
}

output "rg_name" {
  value = local.resource_group
}

output "vnet_name" {
  value = local.vnet_name
}

output "vnet_id" {
  value = local.vnet_id
}

output "subnet_name" {
  value = local.subnet_name
}

output "subnet_id" {
  value = local.subnet_id
}

output "cidr_net" {
  value = local.cidr_net
}

output "ingress_nginx_lb_ip" {
  value = local.ingress_nginx_lb_ip
}

output "shared_keyvault_id" {
  value = local.shared_keyvault_id
}