terraform {
  required_providers {
    helm = {
      version = ">= 2.1.2"
    }
    kubernetes = {
      version = ">= 2.1.0"
    }
    vault = {
      version = ">= 2.22.1"
    }
  }
}
