# Resource 1: Webtier subnet
resource "azurerm_subnet" "websubnet" {
  name = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.web_subnet_address
}
# Resource 2: Network Security Group
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name = "${azurerm_subnet.websubnet.name}-nsg"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
# Resource 3: Associate NSG & Subnet
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_association" {
 depends_on = [
   azurerm_network_security_rule.web_nsg_inbound_rule
 ]
 subnet_id = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}
# Resource 4: local block for security rule
# if the key starts with a number, you mus use the colon syntax ":" instead of "="
locals {
  web_inbound_map = {
    "100" = "80",
    "110" = "443",
    "120" = "22"
  }
}

# NSG Inbound Rule for webtier
resource "azurerm_network_security_rule" "web_nsg_inbound_rule" {
  for_each = local.web_inbound_map
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
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}
/*
# security rule port 80, 443, 22
resource "azurerm_network_security_rule" "rule22" {
  name                        = "Rule-port-22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}
*/