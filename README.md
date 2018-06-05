terraform `gke-std` module
===

[![Build Status](https://travis-ci.org/lsst-sqre/terraform-gke-std.png)](https://travis-ci.org/lsst-sqre/terraform-gke-std)

Usage
---

    module "gke4u" {
      source = "github.com/lsst-sqre/terraform-gke-std"
      name = "mycluster"
      google_project = "plasma-geode-127520" # default
      initial_node_count = 3 # default
    }

Outputs
---

* `host`
* `client_certificate`
* `client_key`
* `cluster_ca_certificate`

Resources created
---

* `google_container_cluster.gke-std`

See Also
---

* [`terraform`](https://www.terraform.io/)
