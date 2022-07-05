# Virtual Network, Subnets and subnet NSG
# Virtual Network
variable "vnet_name" {
  description = "Virtual Network Name"
  type = string
  default = "Vnet-default"
}
# Vnet name address space
variable "vnet_address_space" {
  description = "Vnet Address Space"
  type = list(string)
  default = ["10.0.0.0/16"]

}

# web subnet name
variable "web_subnet_name" {
  description = "web subnet name"
  type = string
  default = "websubnet"
}
# web subnet address space
variable "web_subnet_address" {
  description = "vnet subnet address space"
  type = list(string)
  default = [ "10.0.1.0/24" ]
}
# App subnet name
variable "app_subnet_name" {
  description = "App Subnet Name"
  type = string
  default = "AppSubnet"
}
# App subnet address space
variable "app_subnet_address" {
  description = "App subnet address"
  type = list(string)
  default = [ "10.0.11.0/24" ]
}
# Database subnet name
variable "db_subnet_name" {
  description = "db subnet name"
  type = string
  default = "dbsubnet"
}
# Database subnet address space
variable "db_subnet_address" {
  description = "db subnet address space"
  type = list(string)
  default = [ "10.0.21.0/24" ]
}
# Bastion Management subnet
variable "bastion_subnet_name" {
  description = "Bastion subnet name"
  type = string
  default = "bastionsubnet"
}
# Bastion management address
variable "bastion_subnet_address" {
  description = "Bastion subnet address space"
  type = list(string)
  default = [ "10.0.100.0/24" ]
}
