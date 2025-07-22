# link to get all providers info
# https://registry.terraform.io/namespaces/hashicorp
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.5.3"
    }
     null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
}