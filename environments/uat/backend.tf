/*
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"   # Already exists
    storage_account_name = "tfstate123"
    container_name       = "tfstate"
    key                  = "uat.tfstate"
  }
}
*/