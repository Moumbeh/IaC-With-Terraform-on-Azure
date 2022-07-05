# Resource-1 Apptier subnet
resource "azurerm_subnet" "dbsubnet" {
  name = "${azurerm_virtual_network.vnet.name}-${var.db_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.db_subnet_address
}
# Resource-2 Network security Group
resource "azurerm_network_security_group" "db_subnet_nsg" {
  name = "${azurerm_subnet.dbsubnet.name}-nsg"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
# Resource-3 Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg_associate" {
 depends_on = [ azurerm_network_security_rule.db_nsg_inbound_rule]     
 subnet_id = azurerm_subnet.dbsubnet.id
 network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
}
# Resource 4: local block for security rule
# if the key starts with a number, you mus use the colon syntax ":" instead of "="
locals {
  db_inbound_map = {
    "100" = "3306",
    "110" = "1433",
    "120" = "5432"
  }
}

# NSG Inbound Rule for webtier
resource "azurerm_network_security_rule" "db_nsg_inbound_rule" {
  for_each = local.db_inbound_map
  name                        = "Rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.db_subnet_nsg.name
}