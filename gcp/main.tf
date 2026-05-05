terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.30.0"
    }
  }
}

provider "google" {
  project     = var.projecto
  region      = var.region
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}