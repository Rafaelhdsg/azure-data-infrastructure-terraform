# Create all Resource Groups
resource "azurerm_resource_group" "default" {
  for_each = var.resource_groups

  name     = each.key
  location = var.location

  tags = {
    environment = each.key
    managed_by  = "terraform"
  }
}

# Get current client info for Key Vault access policy
data "azurerm_client_config" "current" {}
