provider "azurerm" {
  features {}
   subscription_id = var.subscription_id
}


resource "azurerm_resource_group" "teja1_task" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "vnet11" {
  name                = "vnet11"
  address_space       = ["10.1.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
  depends_on = [ azurerm_resource_group.teja1_task ]
  
}

resource "azurerm_virtual_network" "vnet12" {
  name                = "vnet12"
  address_space       = ["10.2.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
  depends_on = [ azurerm_resource_group.teja1_task ]
  
}

resource "azurerm_subnet" "subnet11" {
  name = "subnet11"
 # name                 = "${var.subnet}${count.index + 1}"
 # count                = var.all_count 
  resource_group_name  = var.rg
  virtual_network_name = "vnet11"
  address_prefixes     = ["10.1.2.0/24"] 
}

resource "azurerm_subnet" "subnet12" {
  name = "subnet12"
 # name                 = "${var.subnet}${count.index + 1}"
 # count                = var.all_count 
  resource_group_name  = var.rg
  virtual_network_name = "vnet12"
  address_prefixes     = ["10.2.2.0/24"] 
}

