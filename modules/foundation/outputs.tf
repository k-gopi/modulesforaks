output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "location" {
  value = azurerm_resource_group.this.location
}

output "tags" {
  value = local.common_tags
}

output "name_prefix" {
  value = local.name_prefix
}