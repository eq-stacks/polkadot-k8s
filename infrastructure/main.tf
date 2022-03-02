variable "credentials_file" {}
variable "service_account_project" {}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "4.8.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.service_account_project
}

data "google_service_account" "terraform" {
  account_id = "terraform"
}