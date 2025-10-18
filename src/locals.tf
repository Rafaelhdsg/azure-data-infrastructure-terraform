locals {
  # Flatten and normalize all resource groups data
  resource_groups = {
    for rg_name, rg_data in var.resource_groups :
    rg_name => {
      name       = rg_name
      key_vaults = rg_data.key_vaults
      storages   = rg_data.storages
    }
  }

  # Build a per-RG map of Key Vaults
  key_vaults = {
    for rg_name, rg_data in var.resource_groups :
    rg_name => [
      for kv in rg_data.key_vaults :
      merge(kv, { rg_name = rg_name })
    ]
  }

  # Flatten all Key Vaults into a single iterable map
  key_vault_list = merge([
    for kvs in local.key_vaults : {
      for kv in kvs : "${kv.rg_name}-${kv.name}" => kv
    }
  ]...)

  # Build a per-RG map of Storage Accounts
  storages = {
    for rg_name, rg_data in var.resource_groups :
    rg_name => [
      for st in rg_data.storages :
      merge(st, { rg_name = rg_name })
    ]
  }

  # Flatten all Storages into a single iterable map
  storage_list = merge([
    for sts in local.storages : {
      for st in sts : "${st.rg_name}-${st.name}" => st
    }
  ]...)
}
