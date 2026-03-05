resource "azurerm_route_table" "tables" {
  for_each = { for rt in var.route_tables : rt.name => rt }
  name                = each.value.name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_route_table_association" "assoc" {
  for_each = { for rt in var.route_tables : rt.name => rt }
  subnet_id      = azurerm_subnet.subnets[each.value.subnet_name].id
  route_table_id = azurerm_route_table.tables[each.key].id
}