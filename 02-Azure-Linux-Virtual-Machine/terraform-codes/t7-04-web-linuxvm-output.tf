# Public IP

output "web_linuxvm_public_ip" {
  description = "web linux VM public ip"
  value = azurerm_public_ip.web_linuxvm_publicip.ip_address
}

# Network Interface
## Network Interface ID
output "web_linux_network_interface_id" {
  description = "web linux VM Network Interface id"
  value = azurerm_network_interface.web_linuxvm_nic.id
}
## Network interface private ip address
output "web_linuxvm_private_ip" {
  description = "web linux VM private ip"
  value = azurerm_linux_virtual_machine.web_linuxvm.private_ip_address
}
## Virtual machine 128-bit id
output "web_linux_virtual_machine_id_128bit" {
  description = "web linux vm id 128-bit identifier"
  value = azurerm_linux_virtual_machine.web_linuxvm.virtual_machine_id
}
## VM ID
output "web_linuxvm_virtual_machine_id" {
  description = "web linux VM ID"
  value = azurerm_linux_virtual_machine.web_linuxvm.id
}
## VM Public IP
output "web_linux_public_ip_address" {
  description = "Web Linux Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.web_linuxvm.public_ip_address
}
## VM Private IP
output "web_linux_private_ip_address" {
  description = "web linux virtual machine private ip"
  value = azurerm_linux_virtual_machine.web_linuxvm.private_ip_address
}