output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  value = { for s in azurerm_subnet.subnets : s.name => s.id }
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "route_table_ids" {
  value = { for rt in azurerm_route_table.tables : rt.name => rt.id }
}

output "private_dns_zone_ids" {
  value = { for z in azurerm_private_dns_zone.zones : z.name => z.id }
}