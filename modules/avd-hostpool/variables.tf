variable "name" {
  type        = string
  description = "AVD host pool name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "type" {
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
  description = "Maximum sessions per host"
  default     = 1
}

variable "preferred_app_group_type" {
  type        = string
  description = "Preferred app group type"
  default     = "Desktop"
}

variable "validate_environment" {
  type        = bool
  description = "Validate AVD environment"
  default     = false
}

variable "start_vm_on_connect" {
  type        = bool
  description = "Start VM on user connect"
  default     = false
}

variable "description" {
  type        = string
  description = "Host pool description"
  default     = "Sample AVD host pool"
}

variable "custom_rdp_properties" {
  type        = string
  description = "Optional RDP properties"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
