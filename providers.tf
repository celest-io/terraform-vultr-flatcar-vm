terraform {
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = "~> 0.10"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.11"
    }
  }
  required_version = ">= 1.0"
}
