terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate123abcxyz"
    container_name       = "tfstate"
    key                  = "uat.tfstate"
  }
}