terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_desktop_workspace" "this" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  friendly_name       = var.workspace_name
  description         = "Sample AVD workspace"

  tags = var.tags
}

module "hostpool" {
  source = "../modules/avd-hostpool"

  name                     = var.host_pool_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  type                     = var.host_pool_type
  load_balancer_type       = var.load_balancer_type
  maximum_sessions_allowed = var.maximum_sessions_allowed
  preferred_app_group_type = "Desktop"
  start_vm_on_connect      = var.start_vm_on_connect
  description              = "Sample host pool for GitHub reference repo"
  tags                     = var.tags
}

module "appgroup" {
  source = "../modules/avd-appgroup"

  name                = var.application_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Desktop"
  host_pool_id        = module.hostpool.id
  workspace_id        = azurerm_virtual_desktop_workspace.this.id
  friendly_name       = var.application_group_name
  description         = "Sample desktop application group"
  tags                = var.tags
}

module "sessionhost" {
  count  = var.deploy_session_host ? 1 : 0
  source = "../modules/avd-sessionhost"

  vm_name             = var.session_host_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  host_pool_name      = var.host_pool_name
  registration_token  = var.registration_token
  tags                = var.tags
}

module "user_assignment" {
  count  = var.user_object_id != null && var.user_object_id != "" ? 1 : 0
  source = "../modules/avd-user-assignment"

  application_group_id = module.appgroup.id
  user_object_id       = var.user_object_id
}
