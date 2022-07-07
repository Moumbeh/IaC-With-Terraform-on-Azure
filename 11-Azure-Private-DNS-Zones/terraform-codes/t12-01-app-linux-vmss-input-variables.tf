# Inbound Ports
variable "app_vmss_nsg_inbound_ports" {
  description = "App VMSS NSG Inbound Ports"
  type = list(string)
  default = [ 22, 80, 443 ]
}