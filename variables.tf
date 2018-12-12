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

variable "gke_version" {
  description = "gke master/node version"
  default     = "latest"
}

variable "machine_type" {
  description = "machine type of default gke pool nodes"
  default     = "n1-standard-1"
}
