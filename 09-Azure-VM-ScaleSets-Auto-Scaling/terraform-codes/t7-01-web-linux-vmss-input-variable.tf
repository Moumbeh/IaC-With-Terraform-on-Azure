# Linux VM Input Variable
variable "web_vmss_nsg_inbound_ports" {
  description = "web vmss NSG Inbound Ports"
  type = list(string)
  default = [ 22, 80, 443 ]
}