terraform {
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
      version = "0.0.7"
    }
  }
  required_version = ">= 0.13"
}