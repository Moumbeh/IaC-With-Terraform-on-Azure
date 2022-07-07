# Storage Input variables
variable "storage_account_name" {
  description = "storage account name"
  type = string
}
variable "storage_account_tier" {
  description = "Storage account tier"
  type = string
}
variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type = string
}
variable "storage_storage_kind" {
 description = "Storage Account Kind"
 type = string 
}
variable "static_website_index_document" {
  description = "Static website index document"
  type = string
}
variable "static_website_error_404_document" {
  description = "Static website error 404 document"
  type = string
}