variable "location" {
  type    = string
  default = "japaneast"
}

variable "resource_group_name" {
  type = string
}

variable "workspace_name" {
  type = string
}

variable "host_pool_name" {
  type = string
}

variable "host_pool_type" {
  type    = string
  default = "Personal"
}

variable "load_balancer_type" {
  type    = string
  default = "Persistent"
}

variable "maximum_sessions_allowed" {
  type    = number
  default = 1
}

variable "start_vm_on_connect" {
  type    = bool
  default = false
}

variable "application_group_name" {
  type = string
}

variable "deploy_session_host" {
  type    = bool
  default = true
}

variable "session_host_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
  default   = null
}

variable "registration_token" {
  type      = string
  sensitive = true
}

variable "user_object_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
