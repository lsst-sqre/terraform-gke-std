terraform `gke-std` module
===

[![Build Status](https://travis-ci.org/lsst-sqre/terraform-gke-std.png)](https://travis-ci.org/lsst-sqre/terraform-gke-std)

Usage
---

    module "gke4u" {
      source             = "git::https://github.com/jhoblitt/terraform-gke-std.git//?ref=master"
      name               = "mycluster"
      google_project     = "plasma-geode-127520" # default
      google_region      = "us-central1" # default
      google_zone        = "us-central1-b" # default
      initial_node_count = 3 # default
      gke_version        = "latest" # default
      machine_type       = "n1-standard-1" # default
    }

    provider "kubernetes" {
      version = "~> 1.4"

      load_config_file = true

      host                   = "${module.gke4u.host}"
      cluster_ca_certificate = "${base64decode("${module.gke4u.cluster_ca_certificate}")}"
    }

Outputs
---

* `host`
* `client_certificate`
* `client_key`
* `cluster_ca_certificate`
* `id`

Resources created
---

* `google_container_cluster.gke-std`
* `kubernetes_storage_class.pd_ssd`

See Also
---

* [`terraform`](https://www.terraform.io/)
