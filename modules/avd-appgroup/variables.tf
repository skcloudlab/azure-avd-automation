variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "type" {
  type        = string
  description = "Desktop or RemoteApp"
  default     = "Desktop"
}

variable "host_pool_id" {
  type = string
}

variable "workspace_id" {
  type = string
}

variable "friendly_name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = "Sample AVD application group"
}

variable "tags" {
  type    = map(string)
  default = {}
}
