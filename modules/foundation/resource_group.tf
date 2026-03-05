resource "azurerm_resource_group" "this" {
  name     = "${var.project_name}-${var.environment}-${var.rg_name_suffix}"
  location = var.location

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    CostCenter  = var.cost_center
    ManagedBy   = "Terraform"
  }
}