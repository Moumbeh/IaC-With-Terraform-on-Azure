
# Network Interface
## Network Interface ID
output "web_linux_network_interface_id" {
  description = "web linux VM Network Interface id"
  value = azurerm_linux_virtual_machine_scale_set.web_vmss.network_interface
}

## Virtual machine instance
output "web_linux_virtual_machine_id_128bit" {
  description = "web linux vm instance"
  value = azurerm_linux_virtual_machine_scale_set.web_vmss.instances
}
## VM ID
output "web_linuxvm_virtual_machine_Scaleset_id" {
  description = "web linux VMSS ID"
  value = azurerm_linux_virtual_machine_scale_set.web_vmss.id
}