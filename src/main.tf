resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Storage Account for data storage
# Architecture Rationale: Storage Accounts are fundamental for data infrastructure,
# offering various types (Blob, File, Queue, Table) and tiers. Here, we provision
# a general-purpose v2 account suitable for most data workloads.
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"    # Geo-Redundant Storage for high durability
  min_tls_version          = "TLS1_2" # Enforce latest TLS version for security
}

# Azure Key Vault for secure secret management
# Architecture Rationale: Key Vault is crucial for any cloud solution requiring
# secure storage of secrets, keys, and certificates. It integrates well with
# other Azure services and provides robust access control.
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true # Example of enabling a common feature
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  # Example access policy for the current user (for demonstration)
  # In a production scenario, this would typically be an application service principal
  # or a managed identity.
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge",
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge",
    ]

    certificate_permissions = [
      "Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge",
    ]
  }
}

# Simulate a secret in Key Vault
# Architecture Rationale: Storing sensitive information like database connection strings
# or API keys in Key Vault is a security best practice. This demonstrates how secrets
# can be managed programmatically.
resource "azurerm_key_vault_secret" "app_secret" {
  name         = "app-secret"
  value        = "supersecretvalue"
  key_vault_id = azurerm_key_vault.kv.id

  # Example of content_type for better organization
  content_type = "text/plain"
}

# Data source to get the current client configuration for Key Vault access policies
data "azurerm_client_config" "current" {}


