variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name (uat or prod)"
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