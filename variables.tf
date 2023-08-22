variable "location" {
  description = "value"
  type        = string
  default     = "West US"
}
variable "resource_group_name" {
  description = "name of rg"
  type        = string
}
variable "name" {
  description = "name of vm"
  type        = string
}
variable "vnetname" {
  description = "name of vnet"
  type        = string
}

variable "vmnic" {
  description = "name of nic"
  type        = string
}

variable "vmsubnetid" {
  description = "id of subnet associated with vm"
  type        = string
}

variable "pesubnetid" {
  description = "id subnet associated with private endpoint"
  type        = string
}

variable "nsgid" {
  description = "nsgid"
  type        = string
}