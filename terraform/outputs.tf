output "workspace_id" {
  value = azurerm_virtual_desktop_workspace.this.id
}

output "host_pool_id" {
  value = module.hostpool.id
}

output "application_group_id" {
  value = module.appgroup.id
}

output "session_host_vm_name" {
  value = try(module.sessionhost[0].vm_name, null)
}
