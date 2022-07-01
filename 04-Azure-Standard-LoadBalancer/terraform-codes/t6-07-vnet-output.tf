# Virtual Network Output
## Virtual Network Name
output "Virtual_Network_Name" {
  description = "Virtual Nertwork Name"
  value = azurerm_virtual_network.vnet.name
}
## Virtual Network ID
output "Virtual_network_id" {
  description = "Virtual Network ID"
  value = azurerm_virtual_network.vnet.id
}

# Subnet Outputs (We will write for one web subnet and rest all we will ignore for now)
## Subnet Name 
output "web_subnet_name" {
  description = "WebTier Subnet Name"
  value = azurerm_subnet.websubnet.name
}
output "app_subnet_name" {
  description = "AppTier Subnet Name"
  value = azurerm_subnet.appsubnet.name
}
output "db_subnet_name" {
  description = "DbTier Subnet Name"
  value = azurerm_subnet.dbsubnet.name
}
output "bastion_subnet_name" {
  description = "BastionTier Subnet Name"
  value = azurerm_subnet.bastionsubnet.name
}

## Subnet ID 
output "web_subnet_id" {
  description = "WebTier Subnet ID"
  value = azurerm_subnet.websubnet.id
}
output "app_subnet_id" {
  description = "AppTier Subnet ID"
  value = azurerm_subnet.appsubnet.id
}
output "db_subnet_id" {
  description = "DbTier Subnet ID"
  value = azurerm_subnet.dbsubnet.id
}
output "bastion_subnet_id" {
  description = "BastionTier Subnet ID"
  value = azurerm_subnet.bastionsubnet.id
}
# Network Security Outputs
## Web Subnet NSG Name 
output "web_subnet_nsg_name" {
  description = "WebTier Subnet NSG Name"
  value = azurerm_network_security_group.web_subnet_nsg.name
}
output "app_subnet_nsg_name" {
  description = "AppTier Subnet NSG Name"
  value = azurerm_network_security_group.app_subnet_nsg.name
}
output "db_subnet_nsg_name" {
  description = "DbTier Subnet NSG Name"
  value = azurerm_network_security_group.db_subnet_nsg.name
}
output "bastion_subnet_nsg_name" {
  description = "BastionTier Subnet NSG Name"
  value = azurerm_network_security_group.bastion_subnet_nsg.name
}

## Web Subnet NSG ID 
output "web_subnet_nsg_id" {
  description = "WebTier Subnet NSG ID"
  value = azurerm_network_security_group.web_subnet_nsg.id
}
output "app_subnet_nsg_id" {
  description = "AppTier Subnet NSG ID"
  value = azurerm_network_security_group.app_subnet_nsg.id
}
output "db_subnet_nsg_id" {
  description = "DbTier Subnet NSG ID"
  value = azurerm_network_security_group.db_subnet_nsg.id
}
output "bastion_subnet_nsg_id" {
  description = "BastionTier Subnet NSG ID"
  value = azurerm_network_security_group.bastion_subnet_nsg.id
}
