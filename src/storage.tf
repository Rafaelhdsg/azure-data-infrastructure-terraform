# Azure Storage Account for data storage
# Architecture Rationale: Storage Accounts are fundamental for data infrastructure,
# offering various types (Blob, File, Queue, Table) and tiers. Here, we provision
# a general-purpose v2 account suitable for most data workloads.
resource "azurerm_storage_account" "default" {
  for_each = local.storage_list

  name                     = each.value.name
  location                 = var.location
  resource_group_name      = azurerm_resource_group.default[each.value.rg_name].name
  account_tier             = "Standard"
  account_replication_type = "GRS" # Geo-Redundant Storage for high durability
}

