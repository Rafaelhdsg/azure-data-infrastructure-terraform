variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "The Storage Account name must be between 3 and 24 characters long."
  }
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  validation {
    condition     = length(var.key_vault_name) >= 3 && length(var.key_vault_name) <= 24
    error_message = "The Key Vault name must be between 3 and 24 characters long."
  }
}

variable "environment" {
  description = "Deployment environment (e.g., dev, sbx, prod)"
  type        = string
}


