variable "vm_name" {}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "admin_username" {
  default = "azureuser"
}
variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
