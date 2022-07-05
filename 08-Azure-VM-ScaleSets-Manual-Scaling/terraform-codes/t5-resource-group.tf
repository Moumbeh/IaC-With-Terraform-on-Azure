# Resource Group
resource "azurerm_resource_group" "rg" {
  #name = "${local.resource_name_prefix}-${var.resource_group_name}" added random string to prevent caching since am doing lots of demos
  name = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location 
  tags = local.common_tags
}