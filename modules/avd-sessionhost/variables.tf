variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
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
  type        = string
  default     = null
  sensitive   = true
  description = "Optional admin password"
}

variable "os_disk_type" {
  type    = string
  default = "Premium_LRS"
}

variable "image_publisher" {
  type    = string
  default = "MicrosoftWindowsDesktop"
}

variable "image_offer" {
  type    = string
  default = "windows-11"
}

variable "image_sku" {
  type    = string
  default = "win11-23h2-avd"
}

variable "image_version" {
  type    = string
  default = "latest"
}

variable "host_pool_name" {
  type = string
}

variable "registration_token" {
  type      = string
  sensitive = true
}

variable "dsc_modules_url" {
  type        = string
  description = "URL for DSC modules package"
  default     = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration.zip"
}

variable "tags" {
  type    = map(string)
  default = {}
}
