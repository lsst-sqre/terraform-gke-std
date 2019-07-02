resource "kubernetes_storage_class" "pd_ssd" {
  provider = "kubernetes.gke_std"

  # note that storageclass is not namespaced
  metadata {
    name = "pd-ssd"

    labels {
      name = "pd-ssd"
    }
  }

  storage_provisioner = "kubernetes.io/gce-pd"

  parameters {
    type = "pd-ssd"
  }

  # needed when the gke cluster is recreated
  depends_on = [
    "google_container_cluster.gke_std",
  ]
}
