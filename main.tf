module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_resource_group" "main" {
  name     = "epic-ire-rg"
  location = "East US"
}




#IAM

module "iam" {
  source                   = "./modules/iam"
  target_resource_group_id = azurerm_resource_group.main.id
}



#VM's

module "vm" {
  source              = "./modules/vm"
  vm_name             = "epic-ire-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.web_subnet_id
  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
}
