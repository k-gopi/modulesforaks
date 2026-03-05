locals {
  name_prefix = "${var.project_name}-${var.environment}"
  resource_group_name = "rg-${local.name_prefix}-${var.location}"
}