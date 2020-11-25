provider "google" {
  credentials = file("${local.directories.secrets}/gcp-homelab-service-account.json")
  project     = "${var.gcp_project}"
  region      = "us-east-4"
}
