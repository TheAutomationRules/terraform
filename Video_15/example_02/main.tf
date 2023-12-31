# ------------------------------------------------------------------------------
# LOCAL VARIABLES
# ------------------------------------------------------------------------------

locals {

  environments = {
    default = {
      subscription_id = "< SUBSCRIPTION ID >"
      location        = "< LOCATION >"
      resource_group  = "< RESOURCE GROUP NAME >"
      network         = {
        vnet_name           = "< AZURE VNET NAME >"
        subnet_name         = "< AZURE SUBNET NAME >"
        cidr_net            = "< NETWORK CIDR >"
        ingress_nginx_lb_ip = "< INGRESS NGINX LOAD BALANCER IP >"
      }
    }
    shared = {
      tenant_id             = "34c4878f-a462-4614-94cb-aadbb2cc7c85"
      keyvault_subscription = "00000000-0000-0000-0000-000000000000"
      keyvault_name         = "weu-shared-secrets"
      keyvault_rg           = "weu-shared-resources"
    }
    dev = {
      subscription_id = "10000000-0000-0000-0000-000000000001"
      location        = "West Europe"
      resource_group  = "dev-west-europe-01"
      network         = {
        vnet_name           = "dev-west-europe-001"
        subnet_name         = "dev-west-europe-001"
        cidr_net            = "10.1.0.0"
        ingress_nginx_lb_ip = "10.1.0.250"
      }
    }
    test = {
      subscription_id = "20000000-0000-0000-0000-000000000002"
      location        = "East US"
      resource_group  = "test-east_us-02"
      network         = {
        vnet_name           = "test-east-us-002"
        subnet_name         = "test-east-us-002"
        cidr_net            = "10.2.0.0"
        ingress_nginx_lb_ip = "10.2.0.250"
      }
    }
    pro = {
      subscription_id = "30000000-0000-0000-0000-000000000003"
      location        = "East Asia"
      resource_group  = "pro-east-asia-03"
      network         = {
        vnet_name           = "pro-east-asia-003"
        subnet_name         = "pro-east-asia-003"
        cidr_net            = "10.3.0.0"
        ingress_nginx_lb_ip = "10.3.0.250"
      }
    }
  }

  subscription_id     = lookup(local.environments[terraform.workspace], "subscription_id")
  location            = lookup(local.environments[terraform.workspace], "location")
  resource_group      = lookup(local.environments[terraform.workspace], "resource_group")
  vnet_name           = lookup(local.environments[terraform.workspace].network, "vnet_name")
  vnet_id             = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
  subnet_name         = lookup(local.environments[terraform.workspace].network, "subnet_name")
  subnet_id           = "/subscriptions/${local.subscription_id}/resourceGroups/${local.resource_group}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}/subnets/${local.subnet_name}"
  cidr_net            = lookup(local.environments[terraform.workspace].network, "cidr_net")
  ingress_nginx_lb_ip = lookup(local.environments[terraform.workspace].network, "ingress_nginx_lb_ip")

  shared_keyvault_id = "/subscriptions/${local.environments.shared.keyvault_subscription}/resourceGroups/${local.environments.shared.keyvault_rg}/providers/Microsoft.KeyVault/vaults/${local.environments.shared.keyvault_name}"

}