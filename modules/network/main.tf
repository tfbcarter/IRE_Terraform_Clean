# resource "azurerm_virtual_network" "vnet" {
#   name                = "epic-ire-vnet"
#   address_space       = ["10.10.0.0/16"]
#   location            = var.location
#   resource_group_name = var.resource_group_name
# }

# resource "azurerm_subnet" "gateway" {
#   name                 = "GatewaySubnet"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.10.0.0/24"]
# }

resource "azurerm_virtual_network" "vnet" {
  name                = "epic-ire-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnets
resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.0.0/24"]
}

resource "azurerm_subnet" "service" {
  name                 = "ServiceSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "web" {
  name                 = "WebSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_subnet" "oob" {
  name                 = "OOBSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.3.0/24"]
}

resource "azurerm_subnet" "kuiper" {
  name                 = "KuiperSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.4.0/24"]
}

resource "azurerm_subnet" "systempulse" {
  name                 = "SystemPulseSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.5.0/24"]
}

# NSG

resource "azurerm_network_security_group" "nsg" {
  name                = "epic-ire-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_security_group" "ire_nsg" {
  name                = "ire-default-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# resource "azurerm_subnet_network_security_group_association" "gateway" {
#   subnet_id                 = azurerm_subnet.gateway.id
#   network_security_group_id = azurerm_network_security_group.ire_nsg.id
# }

resource "azurerm_subnet_network_security_group_association" "service" {
  subnet_id                 = azurerm_subnet.service.id
  network_security_group_id = azurerm_network_security_group.ire_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "web" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.ire_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "oob" {
  subnet_id                 = azurerm_subnet.oob.id
  network_security_group_id = azurerm_network_security_group.ire_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "kuiper" {
  subnet_id                 = azurerm_subnet.kuiper.id
  network_security_group_id = azurerm_network_security_group.ire_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "systempulse" {
  subnet_id                 = azurerm_subnet.systempulse.id
  network_security_group_id = azurerm_network_security_group.ire_nsg.id
}
