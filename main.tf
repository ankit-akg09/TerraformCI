terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "Ankit_Terraform_Study"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg1" {
  name     = "Terraform_Study"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stgrcaim1001"
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  resource_group_name      = azurerm_resource_group.rg1.name
}
