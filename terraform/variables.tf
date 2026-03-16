variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for AVD resources"
}

variable "workspace_name" {
  type        = string
  description = "AVD workspace name"
}

variable "host_pool_name" {
  type        = string
  description = "AVD host pool name"
}

variable "host_pool_type" {
  type        = string
  description = "Host pool type: Personal or Pooled"
  default     = "Personal"
}

variable "load_balancer_type" {
  type        = string
  description = "Load balancer type"
  default     = "Persistent"
}

variable "maximum_sessions_allowed" {
  type        = number
  description = "Maximum sessions allowed per host"
  default     = 1
}

variable "start_vm_on_connect" {
  type        = bool
  description = "Start VM on connect"
  default     = false
}

variable "application_group_name" {
  type        = string
  description = "Desktop application group name"
}

variable "deploy_session_host" {
  type        = bool
  description = "Whether to deploy a sample session host"
  default     = true
}

variable "session_host_name" {
  type        = string
  description = "Session host VM name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for session host network interface"
}

variable "vm_size" {
  type        = string
  description = "Session host VM size"
  default     = "Standard_D4s_v5"
}

variable "admin_username" {
  type        = string
  description = "Local administrator username"
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "Local administrator password"
  default     = null
  sensitive   = true
}

variable "registration_token" {
  type        = string
  description = "AVD registration token"
  sensitive   = true
}

variable "user_object_id" {
  type        = string
  description = "User object ID for application group assignment"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
