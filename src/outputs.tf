output "storage_account_name" {
  description = "The name of the Azure Storage Account."
  value       = azurerm_storage_account.sa.name
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary blob endpoint for the Azure Storage Account."
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}

output "key_vault_name" {
  description = "The name of the Azure Key Vault."
  value       = azurerm_key_vault.kv.name
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault."
  value       = azurerm_key_vault.kv.vault_uri
}

output "app_secret_value" {
  description = "The value of the simulated application secret (for demonstration purposes only)."
  value       = azurerm_key_vault_secret.app_secret.value
  sensitive   = true # Mark as sensitive to prevent accidental logging
}


