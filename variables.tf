variable "resource_group_name" {
  type        = string
  description = "Target Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "address_space" {
  type        = list(string)
  description = "VNet address space CIDR list"
}

variable "subnets" {
  type = map(object({
    address_prefixes                          = list(string)
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }), null)
  }))
  default     = {}
  description = "Map of subnets to create inside the VNet"
}

variable "peering_configurations" {
  type = map(object({
    remote_vnet_id               = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, false)
    allow_gateway_transit        = optional(bool, false)
    use_remote_gateways          = optional(bool, false)
  }))
  default     = {}
  description = "Map of outbound peerings to establish from this VNet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
