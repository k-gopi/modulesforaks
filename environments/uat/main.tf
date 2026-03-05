# Foundation module: Resource Group
module "foundation" {
  source       = "../../modules/foundation"
  project_name = var.project_name
  environment  = var.environment
  location     = var.location
  owner        = var.owner
  cost_center  = var.cost_center
  rg_name_suffix = var.rg_name_suffix
}

# Networking module
module "networking" {
  source       = "../../modules/networking"
  project_name = var.project_name
  environment  = var.environment
  location     = var.location
  rg_name      = module.foundation.resource_group_name

  subnets = [
    { name = "aks-subnet", prefix = "10.0.1.0/24" },
    { name = "app-subnet", prefix = "10.0.2.0/24" }
  ]

  route_tables = [
    { name = "aks-routetable", subnet_name = "aks-subnet" }
  ]

  private_dns_zones = [
    { name = "privatedns.local" }
  ]
}

# Outputs for verification
output "rg_name" {
  value = module.foundation.resource_group_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_ids" {
  value = module.networking.subnet_ids
}