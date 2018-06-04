variable "name" {
  description = "gke cluster name"
}

variable "google_project" {
  description = "google cloud project ID"
  default     = "plasma-geode-127520"
}

variable "initial_node_count" {
  description = "number of gke nodes to start"
  default     = 3
}

provider "google" {
  project = "${var.google_project}"
  region  = "us-central1"
  zone    = "us-central1-b"
  version = "~> 1.13"
}

resource "google_container_cluster" "gke-std" {
  name               = "${var.name}"
  initial_node_count = "${var.initial_node_count}"
  min_master_version = "1.9.4-gke.1"

  addons_config {
    http_load_balancing {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = false
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

output "host" {
  value = "${google_container_cluster.gke-std.endpoint}"
}

output "client_certificate" {
  sensitive = true
  value     = "${google_container_cluster.gke-std.master_auth.0.client_certificate}"
}

output "client_key" {
  sensitive = true
  value     = "${google_container_cluster.gke-std.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  sensitive = true
  value     = "${google_container_cluster.gke-std.master_auth.0.cluster_ca_certificate}"
}
