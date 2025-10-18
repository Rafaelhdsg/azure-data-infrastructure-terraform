variable "location" {
  type        = string
  description = "The Azure region where all resources will be deployed."
  default     = "eastus2"
}

variable "resource_groups" {
  description = "Map defining all Resource Groups and their resources."

  type = map(object({
    key_vaults = optional(list(object({
      name = string
    })), [])
    storages = optional(list(object({
      name = string
    })), [])
  }))
}
