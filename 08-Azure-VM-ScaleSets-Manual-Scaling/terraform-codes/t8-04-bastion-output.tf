# bastion host public ip ouytput
output "bastion_host_linuxvm_public_ip_address" {
  description = "Bastion Host Linux VM Public Adress"
  value = azurerm_public_ip.bastion_host_publicip.ip_address
}
output "baston_host_linuxvm" {
  value = azurerm_linux_virtual_machine.baston_host_linuxvm.computer_name
}