provider "google" {
  project = "${var.google_project}"
  region  = "us-central1"
  zone    = "us-central1-b"
  version = "~> 1.13"
}

resource "google_container_cluster" "gke_std" {
  name               = "${var.name}"
  initial_node_count = "${var.initial_node_count}"
  min_master_version = "${var.gke_version}"
  node_version       = "${var.gke_version}"
  enable_legacy_abac = true

  monitoring_service = "none"

  addons_config {
    http_load_balancing {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = true
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

  node_config {
    image_type   = "COS"
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
