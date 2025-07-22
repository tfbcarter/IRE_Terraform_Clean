# variable "target_resource_group_id" {
#   description = "ID of the resource group to assign roles to"
#   type        = string
#   default     = "/subscriptions/6a44db9f-d4b9-4458-bf21-21c29bd6fa3e/resourceGroups/epic-ire-rg"
# }


variable "location" {
  description = "Azure region"
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  default     = "epic-ire-rg"
}



## IAM
variable "target_resource_group_id" {
  description = "ID of the resource group to assign roles to"
  type        = string
  default     = "/subscriptions/6a44db9f-d4b9-4458-bf21-21c29bd6fa3e/resourceGroups/epic-ire-rg"
}


