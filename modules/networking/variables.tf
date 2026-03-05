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

variable "rg_name" {
  description = "Resource Group name for network resources"
  type        = string
}

variable "vnet_name_suffix" {
  description = "VNet name suffix"
  type        = string
  default     = "vnet"
}

variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "List of subnets with name and prefix"
  type = list(object({
    name   = string
    prefix = string
  }))
  default = [
    { name = "aks-subnet", prefix = "10.0.1.0/24" },
    { name = "app-subnet", prefix = "10.0.2.0/24" }
  ]
}

variable "route_tables" {
  description = "Optional route tables for subnets"
  type = list(object({
    name       = string
    subnet_name = string
  }))
  default = []
}

variable "private_dns_zones" {
  description = "Optional private DNS zones to create"
  type = list(object({
    name = string
  }))
  default = []
}