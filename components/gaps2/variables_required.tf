variable "env" {
  description = "Enter the environment. eg prod, aat"
  type        = string
}

variable "product" {
  description = "The name of the product."
  type        = string
}

variable "builtFrom" {
  description = "The name of the Github repo."
}

variable "virtual_network" {
  description = "The details of the virtual network to create new subnets in."
  type = object({
    virtual_network_name = string
    resource_group_name  = string
  })
}

variable "gaps2_subnet_range" {
  description = "The address range for the gaps2 subnet."
  type        = string
}
