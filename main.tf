locals {
  sg_tags = {
      SG-Managed = "Created-By-StackGuardian"
    }
}

module "tf_azurerm_vnet" {
  source = "github.com/StackGuardian/terraform-azurerm-vnet?ref=v2.0.0"

  //for resource group
  resource_group_name = var.resource_group_name
  
  // For Vnet
  vnet_name     = var.vnet_name
  address_space = var.address_space
  dns_servers   = var.dns_servers

  // for tags
  tags          = merge(local.ps_tags,var.tags)

  // for subnet
  subnet_names                                            = var.subnet_names
  subnet_prefixes                                         = var.subnet_prefixes
  subnet_service_endpoints                                = var.subnet_service_endpoints
  subnet_enforce_private_link_endpoint_network_policies   = var.subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies    = var.subnet_enforce_private_link_service_network_policies
}
