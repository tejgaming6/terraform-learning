# link to get all providers info
# https://registry.terraform.io/namespaces/hashicorp
terraform {
  required_providers {

    local = {
      source = "hashicorp/local"
      version = "2.5.3"
    }
     
  }
}