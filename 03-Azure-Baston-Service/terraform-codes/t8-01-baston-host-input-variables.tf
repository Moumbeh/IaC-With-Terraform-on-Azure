# Bastion Linux VM Input Variables 
variable "bastion_service_subnet_name" {
  description = "Bastion service subnet name"
  default = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  default = ["10.0.101.0/27"]
}