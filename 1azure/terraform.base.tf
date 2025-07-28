/*provider "azurerm" {
  features {}
   subscription_id = "" # don't forget to id sub id here
}


resource "azurerm_resource_group" "tej_task" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet}${count.index + 1}"
  count               = var.all_count
  address_space       = ["10.${count.index + 1}.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
  
}

resource "azurerm_subnet" "subn" {
  name                 = "${var.subnet}${count.index + 1}"
  count                = var.all_count
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name

  address_prefixes     = ["10.${count.index + 1}.2.0/24"]
}

resource "azurerm_network_interface" "net_inter_card" {
  name                = "${var.nic}${count.index + 1}"
  count             = var.all_count
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = "${var.ip}${count.index + 1}"
    subnet_id                     = azurerm_subnet.subn[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "elec_cloud_comp" {
  name                = "${var.ec}${count.index + 1}"
  count               = var.all_count
  resource_group_name = var.rg
  location            = var.location
  size                = var.size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.net_inter_card[count.index].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

/*
variable.tf
# fixed should be same 
variable "rg" {
type = any
}

variable "location" {
  type = any
  }
  # could be any name variables 

  variable "vpn" {
    type = any
    }

variable "nic" {
    type = any
    }

variable "ip" {
    type = any
    }
variable "ec" {
    type = any
    }
variable "vnet" {
    type = any
    }
variable "subnet" {
    type = any
    }
variable "size" {
    type = any
    }
                
  variable "storage_account_type" {
    type = any
    }

 variable "all_count" {
    type = number
    } */

    /* rg = "tej_task"

location = "Japan East"

vpn = "vpn1"

nic =  "nic1"

ip = "ip1"

ec = "ec1"

vnet = "vnet1"

subnet = "subnet1"

size = "Standard_B1s"

storage_account_type = "Standard_LRS"

all_count = 3 */