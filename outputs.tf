output "host" {
  value = "${google_container_cluster.gke_std.endpoint}"
}

output "cluster_ca_certificate" {
  sensitive = true
  value     = "${google_container_cluster.gke_std.master_auth.0.cluster_ca_certificate}"
}

output "id" {
  value = "${google_container_cluster.gke_std.id}"
}
