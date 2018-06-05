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
