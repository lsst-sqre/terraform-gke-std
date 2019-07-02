data "template_file" "kubeconfig" {
  template = "${file("${path.module}/templates/kubeconfig.yaml")}"

  vars {
    kubeconfig_name     = "${var.name}"
    endpoint            = "https://${google_container_cluster.gke_std.endpoint}"
    cluster_auth_base64 = "${google_container_cluster.gke_std.master_auth.0.cluster_ca_certificate}"
    gcloud_cmd          = "${var.gcloud_cmd}"
  }
}
