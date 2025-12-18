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
   subscription_id = "fa3325aa-2291-472e-9d80-68f554038ffc"
}
