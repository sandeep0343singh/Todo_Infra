terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "backend-rg"
    storage_account_name = "backendstrg"
    container_name = "strg"
    key = "Todo.dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "249a05f7-c643-4c2a-a2b0-0c1dc39022b7"
}
