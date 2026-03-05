variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment (uat/prod)"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name for security resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD Tenant ID (passed via environment variable)"
  type        = string
  sensitive   = true
}

variable "user_object_id" {
  description = "Object ID of the user/service principal for Key Vault access policy (env variable)"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID for private endpoint"
  type        = string
}

variable "vnet_id" {
  description = "VNet ID to link private DNS zone"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS zone name for Key Vault"
  type        = string
}