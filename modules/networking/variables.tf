# modules/networking/variables.tf
variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (uat/prod)"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "address_space" {
  type        = list(string)
  description = "VNet address space"
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type = list(object({
    name   = string
    prefix = string
  }))
  description = "List of subnets"
}

variable "private_dns_zones" {
  type = list(object({
    name = string
  }))
  description = "List of private DNS zones"
}
variable "route_tables" {
  description = "List of route tables and their associated subnet names"
  type = list(object({
    name        = string
    subnet_name = string
  }))
  default = []
}