variable "google_project" {
  description = "google cloud project ID"
  default     = "plasma-geode-127520"
}

variable "env_name" {
  description = "Name of deployment environment."
}

variable "deploy_name" {
  description = "Name of deployment."
  default     = "gke-demo"
}

# Name of google cloud container cluster to deploy into
data "template_file" "gke_cluster_name" {
  template = "${var.deploy_name}-${var.env_name}"
}
