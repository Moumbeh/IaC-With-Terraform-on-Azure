#General Input Variables
#Business Unit
variable "business_unit" {
  description = "Business Unit in the infrastructure"
  type = string
  default = "Procurement"
}

#Production Environment
variable "Environment" {
  description = "Environment used as prefix for resources"
  type = string
  default = "dev"
}

#Resource Group Name
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg-default"
}

#Resource Group Location
variable "resource_group_location" {
  description = "Region where resources will be created"
  type = string
  default = "eastus2"
}