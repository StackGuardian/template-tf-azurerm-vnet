locals {
  sg_tags = {
      SG-Managed = "Created-By-StackGuardian"
    }
}

module "tf_azurerm_vnet" {
  source = "github.com/StackGuardian/terraform-azurerm-vnet?ref=2.0.0"

  resource_group_name = var.resource_group_name
  
  vnet_name     = var.vnet_name
  address_space = var.address_space
  dns_servers   = var.dns_servers

  tags          = merge(local.ps_tags,var.tags)

  subnet_names                                            = var.subnet_names
  subnet_prefixes                                         = var.subnet_prefixes
  subnet_service_endpoints                                = var.subnet_service_endpoints
  subnet_enforce_private_link_endpoint_network_policies   = var.subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies    = var.subnet_enforce_private_link_service_network_policies
}
