resource "azurerm_virtual_desktop_host_pool" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  type                     = var.type
  load_balancer_type       = var.load_balancer_type
  maximum_sessions_allowed = var.maximum_sessions_allowed
  preferred_app_group_type = var.preferred_app_group_type
  validate_environment     = var.validate_environment
  start_vm_on_connect      = var.start_vm_on_connect

  description      = var.description
  custom_rdp_properties = var.custom_rdp_properties

  tags = var.tags
}
