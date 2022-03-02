variable "credentials_file" {}
variable "service_account_project" {}
variable "target_project_id" {}
variable "target_project_name" {}
variable "org_id" {}
variable "billing_account" {}
variable "project_owners" {}
variable "project_host_vpc" {}

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

resource "google_project" "target_project" {
  name                = var.target_project_name
  project_id          = var.target_project_id
  org_id              = var.org_id
  auto_create_network = false

  billing_account = var.billing_account
}

resource "google_project_iam_binding" "target_project_owners" {
  project = google_project.target_project.id
  role    = "roles/owner"
  members = var.project_owners
  depends_on = [
    google_project.target_project
  ]
}

resource "google_compute_shared_vpc_service_project" "service_project" {
  host_project    = var.project_host_vpc
  service_project = google_project.target_project.project_id
}