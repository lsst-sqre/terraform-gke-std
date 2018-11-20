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
}
