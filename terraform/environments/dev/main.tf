terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.45"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "pawguard_vpc" {
  name                    = "pawguard-vpc"
  auto_create_subnetworks = false
  description             = "Custom VPC for the PawGuard animal safety platform"
}

resource "google_compute_subnetwork" "pawguard_app_subnet" {
  name          = "pawguard-app-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.pawguard_vpc.id

  description = "Application subnet for PawGuard workloads"
}
