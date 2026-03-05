############################################
# Private Endpoint for Key Vault
############################################
resource "azurerm_private_endpoint" "kv" {
  name                = "${var.project_name}-${var.environment}-kv-pe"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "kv-psc"
    private_connection_resource_id = azurerm_key_vault.main.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}

# ❌ Removed duplicate DNS link to prevent conflict
# resource "azurerm_private_dns_zone_virtual_network_link" "kv_dns" {
#   name                  = "${var.project_name}-${var.environment}-kv-dns-link"
#   resource_group_name   = var.rg_name
#   virtual_network_id    = var.vnet_id
#   private_dns_zone_name = var.private_dns_zone_name
#   registration_enabled  = false
# }