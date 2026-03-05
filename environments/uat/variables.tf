variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (uat/prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
}

variable "cost_center" {
  description = "Cost center tag"
  type        = string
}

variable "rg_name_suffix" {
  description = "Resource Group suffix for naming convention"
  type        = string
}

# Sensitive variables for security module (pass via env variables)
variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}

variable "user_object_id" {
  description = "Azure AD Object ID for Key Vault access"
  type        = string
  sensitive   = true
}