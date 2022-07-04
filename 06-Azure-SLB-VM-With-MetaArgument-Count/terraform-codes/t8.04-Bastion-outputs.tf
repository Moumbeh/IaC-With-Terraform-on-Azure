#Baston Host Public IP
output "baston_host_linuxvm_public_ip_address" {
  description = "Baston Host Linux VM Public IP"
  value = azurerm_public_ip.bastion_host_publicip.ip_address
}