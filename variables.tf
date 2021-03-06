variable "name" {
  description = "gke cluster name"
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

variable "gcloud_cmd" {
  description = "Whether to write a Kubectl config file containing the cluster configuration. Saved to `kubeconfig_output_path`."
  default     = "gcloud"
}
