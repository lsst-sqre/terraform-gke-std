output "host" {
  value = "${google_container_cluster.gke_std.endpoint}"
}

output "cluster_ca_certificate" {
  # not actually sensitive... just a lot of output
  sensitive = true
  value     = "${google_container_cluster.gke_std.master_auth.0.cluster_ca_certificate}"
}

output "kubeconfig_filename" {
  description = "path to output kubeconfig format file"
  value       = "${pathexpand(local_file.kubeconfig.*.filename[0])}"
}

output "kubeconfig" {
  # not actually sensitive... just a lot of output
  sensitive   = true
  description = "kubeconfig format string"
  value       = "${data.template_file.kubeconfig.rendered}"
}

output "id" {
  value = "${google_container_cluster.gke_std.id}"
}
