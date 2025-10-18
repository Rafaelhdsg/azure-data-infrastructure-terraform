# Azure Key Vault for secure secret management
# Architecture Rationale: Key Vault is crucial for any cloud solution requiring
# secure storage of secrets, keys, and certificates. It integrates well with
# other Azure services and provides robust access control.
# Flatten nested structure to map RG → Key Vaults

# Create Key Vaults dynamically
resource "azurerm_key_vault" "default" {
  for_each = local.key_vault_list

  name                = each.value.name
  location            = var.location
  resource_group_name = azurerm_resource_group.default[each.value.rg_name].name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
    certificate_permissions = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
  }

}


# Simulate a secret in Key Vault
# Architecture Rationale: Storing sensitive information like database connection strings
# or API keys in Key Vault is a security best practice. This demonstrates how secrets
# can be managed programmatically.
resource "azurerm_key_vault_secret" "app_secret" {
  for_each = azurerm_key_vault.default

  name         = "app-secret"
  value        = "supersecretvalue"
  key_vault_id = each.value.id

  # Example of content_type for better organization
  content_type = "text/plain"
}
