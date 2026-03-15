resource "azurerm_role_assignment" "desktop_user" {
  scope                = var.application_group_id
  role_definition_name = "Desktop Virtualization User"
  principal_id         = var.user_object_id
}
