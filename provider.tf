terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "google" {
  # project , region , zone
  project = "gft-db-network-team-test"
  region = "europe-west3"
  zone = "europe-west3-a"
}