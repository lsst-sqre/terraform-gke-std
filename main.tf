locals {
  google_region = "us-central1"
  google_zone   = "us-central1-b"
  gke_version   = "${var.gke_version != "latest" ? var.gke_version : data.google_container_engine_versions.gke_std.latest_node_version}"
}

provider "google" {
  version = "~> 1.19"
  alias   = "gke_std"

  project = "${var.google_project}"
  region  = "${local.google_region}"
  zone    = "${local.google_zone}"
}

provider "kubernetes" {
  version = "~> 1.4.0"
  alias   = "gke_std"

  load_config_file = true

  host                   = "${google_container_cluster.gke_std.endpoint}"
  cluster_ca_certificate = "${base64decode("${google_container_cluster.gke_std.master_auth.0.cluster_ca_certificate}")}"
}

data "google_container_engine_versions" "gke_std" {
  provider = "google.gke_std"
}

resource "google_container_cluster" "gke_std" {
  provider = "google.gke_std"

  name               = "${var.name}"
  initial_node_count = "${var.initial_node_count}"
  min_master_version = "${local.gke_version}"
  node_version       = "${local.gke_version}"
  enable_legacy_abac = false

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
    machine_type = "${var.machine_type}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
