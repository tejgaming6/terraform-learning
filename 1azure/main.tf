/* 

provider "azurerm" {
  features {}
   subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "RGNAME" {
  name = var.rgname[1]
  location = var.rglocation[0]
}

resource "azurerm_virtual_network" "VNET" {
  name = "${var.vmname}${count.index + 1}"
  count = var.count_all
  location = azurerm_resource_group.RGNAME.location
  resource_group_name = azurerm_resource_group.RGNAME.name
  address_space = ["10.${count.index + 1}.0.0/16"]
  
}

resource "azurerm_subnet" "SUBNET" {
  name = "${var.subnet}${count.index + 1}"
  count = var.count_all
  virtual_network_name = azurerm_virtual_network.VNET[count.index].name
  resource_group_name = azurerm_resource_group.RGNAME.name
  address_prefixes = ["10.${count.index + 1}.0.0/24"]
  
}

resource "azurerm_public_ip" "PUBLICIP" {
  count = var.count_all
  name = "${var.publc_ip_name}${count.index}"
  location = azurerm_resource_group.RGNAME.location
  allocation_method = "Static"
  resource_group_name = azurerm_resource_group.RGNAME.name

}

resource "azurerm_network_interface" "NIC" {
  count = var.count_all
  name = "${var.network_interface}${count.index + 1}"
  location = azurerm_virtual_network.VNET[count.index].location
  resource_group_name = azurerm_resource_group.RGNAME.name
  

ip_configuration {
  name = "${var.ipname}${count.index + 1}"
  subnet_id = azurerm_subnet.SUBNET[count.index].id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id = azurerm_public_ip.PUBLICIP[count.index].id
}
}
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  count                     = var.count_all
  network_interface_id      = azurerm_network_interface.NIC[count.index].id
  network_security_group_id = azurerm_network_security_group.NSG[count.index].id
}
resource "azurerm_network_security_group" "NSG" {
  count = var.count_all
  name                = "${var.nsg}${count.index + 1}"
  location            = azurerm_resource_group.RGNAME.location
  resource_group_name = azurerm_resource_group.RGNAME.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_linux_virtual_machine" "LINUX" {
  count = var.count_all
  name = "${var.linuxname}${count.index + 1}"
  resource_group_name = azurerm_resource_group.RGNAME.name
  location = azurerm_resource_group.RGNAME.location
  size = var.size
  admin_username = var.username
  network_interface_ids = [azurerm_network_interface.NIC[count.index].id]
  
  admin_ssh_key {
    username = var.username
    public_key = file("~/.ssh/azure_key.pub")

  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical" # Publisher ID
    offer = "0001-com-ubuntu-server-jammy" # Product ID
    sku = "22_04-lts" # Plan ID
    version = "latest" 
  }
  


} 

*/