############################################
# Key Vault
############################################
resource "azurerm_key_vault" "main" {
  name                        = "${var.project_name}-${var.environment}-kv"
  location                    = var.location
  resource_group_name         = var.rg_name
  sku_name                    = "standard"
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = false
  public_network_access_enabled = true

  # Access Policy defined here (remove separate access policy file)
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.user_object_id

    key_permissions         = ["Get", "List", "Create", "Update", "Delete"]
    secret_permissions      = ["Get", "List", "Set", "Delete"]
    certificate_permissions = ["Get", "List"]
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}