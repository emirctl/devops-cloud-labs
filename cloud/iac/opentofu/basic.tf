provider "google" {
  project = "<PROJECT-ID>"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20260128"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }
}
