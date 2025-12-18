terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    # resource_group_name = " "
    # storage_account_name = " "
    # container_name = " "
    # key = " "
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "249a05f7-c643-4c2a-a2b0-0c1dc39022b7"
}
