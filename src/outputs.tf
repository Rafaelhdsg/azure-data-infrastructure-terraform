output "resource_groups" {
  value = { for k, v in azurerm_resource_group.default : k => v.name }
}

output "key_vaults" {
  value = { for k, v in azurerm_key_vault.default : k => v.name }
}

output "storages" {
  value = { for k, v in azurerm_storage_account.default : k => v.name }
}
