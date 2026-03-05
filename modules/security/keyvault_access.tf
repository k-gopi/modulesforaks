############################################
# Additional Key Vault Access Policy for user/service principal
############################################
/*resource "azurerm_key_vault_access_policy" "user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.tenant_id
  object_id    = var.user_object_id   # Use user_object_id from variables.tf

  key_permissions         = ["Get", "List"]
  secret_permissions      = ["Get", "List"]
  certificate_permissions = ["Get", "List"]
}
*/