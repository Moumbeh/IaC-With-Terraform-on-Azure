# Nat Gateway Public IP
resource "azurerm_public_ip" "natgw_publicip" {
  name = "${local.resource_name_prefix}-natgw-publicip"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
  sku = "Standard"
}

# Azure NAT Gateway
resource "azurerm_nat_gateway" "natgw" {
 name = "${local.resource_name_prefix}-natgw"
 location = azurerm_resource_group.rg.location
 resource_group_name = azurerm_resource_group.rg.name
 sku_name = "Standard" 
}

# Assocaite NAT and Public IP
resource "azurerm_nat_gateway_public_ip_association" "natgw_publicip_associate" {
  nat_gateway_id = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.natgw_publicip.id
}

# Associate AppSubnet with NAT Gateway
resource "azurerm_subnet_nat_gateway_association" "natgw_appsubnet_associate" {
  subnet_id = azurerm_subnet.appsubnet.id
  nat_gateway_id = azurerm_nat_gateway.natgw.id
}