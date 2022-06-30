/*
local values assign a name to an expression it can be reference multiple times within a module
key advantage is the ability to change the value in a central place
*/
# Local Values
locals {
  owners = var.business_unit
  Environment = var.Environment
  resource_name_prefix = "${var.business_unit}-${var.Environment}"
  common_tags = {
    owners = local.owners,
    Environment = local.Environment
  }
}