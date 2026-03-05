##########################################################
# UAT Environment Terraform main.tf
# Modules: Foundation, Networking, Security
##########################################################

# ----------------------------
# Foundation module: Resource Group
# Path: ../../modules/foundation
# ----------------------------
module "foundation" {
  source         = "../../modules/foundation"
  project_name   = var.project_name
  environment    = var.environment
  location       = var.location
  owner          = var.owner
  cost_center    = var.cost_center
  rg_name_suffix = var.rg_name_suffix
}

# ----------------------------
# Networking module: VNet, subnets, route tables
# Path: ../../modules/networking
# ----------------------------
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

# ----------------------------
# Security module: Key Vault + Private Endpoint
# Path: ../../modules/security
# ----------------------------
module "security" {
  source = "../../modules/security"

  project_name          = var.project_name
  environment           = var.environment
  rg_name               = module.foundation.resource_group_name
  location              = var.location

  # Sensitive values via environment variables
  tenant_id             = var.tenant_id         # TF_VAR_tenant_id
  user_object_id        = var.user_object_id    # TF_VAR_user_object_id

  subnet_id             = module.networking.subnet_ids["app-subnet"]
  vnet_id               = module.networking.vnet_id
  private_dns_zone_name = module.networking.private_dns_zone_names[0]
}

# ----------------------------
# Outputs for verification
# ----------------------------
output "rg_name" {
  value = module.foundation.resource_group_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_ids" {
  value = module.networking.subnet_ids
}

output "kv_name" {
  value = "${var.project_name}-${var.environment}-kv"
}