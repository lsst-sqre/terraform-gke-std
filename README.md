terraform `gke-std` module
===

[![Build Status](https://travis-ci.org/lsst-sqre/terraform-gke-std.png)](https://travis-ci.org/lsst-sqre/terraform-gke-std)

Usage
---

### create "gke" cluster

```terraform
#
# create gke cluster
#

provider "google" {
  project = "${var.google_project}"
  region  = "${var.google_region}"
  zone    = "${var.google_zone}"
}

# uses google provider
module "gke" {
  source             = "git::https://github.com/jhoblitt/terraform-gke-std.git//?ref=master"
  name               = "mycluster"
  initial_node_count = 3 # default
  gke_version        = "latest" # default
  machine_type       = "n1-standard-1" # default
}
```

### direct `kubernetes` provider config example

```terraform
#
# configure kubernetes provider
#
provider "kubernetes" {
  version = "~> 1.6.2"

  load_config_file = false
  host                   = "${module.gke.host}"
  cluster_ca_certificate = "${base64decode(module.gke.cluster_ca_certificate)}"
  token                  = "${module.gke.token}"
}
```

### `kubernetes` provider using `kubeconfig` example

```terraform
#
# configure kubernetes provider
#

# write out a copy of the kubeconfig
resource "local_file" "kubeconfig" {
  content  = "${module.gke.kubeconfig}"
  filename = "/tmp/kubeconfig"

  depends_on = ["module.gke"]
}

provider "kubernetes" {
  version = "~> 1.6.2"

  config_path      = "/tmp/kubeconfig"
  load_config_file = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcloud\_cmd | Whether to write a Kubectl config file containing the cluster configuration. Saved to `kubeconfig_output_path`. | string | `"gcloud"` | no |
| gke\_version | gke master/node version | string | `"latest"` | no |
| initial\_node\_count | number of gke nodes to start | string | `"3"` | no |
| machine\_type | machine type of default gke pool nodes | string | `"n1-standard-1"` | no |
| name | gke cluster name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_ca\_certificate |  |
| host | kubernetes cluster api endpoint host |
| id |  |
| kubeconfig | kubeconfig format string |
| token | kubernetes cluster access token |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

`pre-commit` hooks
---

```bash
go get github.com/segmentio/terraform-docs
pip install --user pre-commit
pre-commit install

# manual run
pre-commit run -a
```

See Also
---

* [`terraform`](https://www.terraform.io/)
* [`terragrunt`](https://github.com/gruntwork-io/terragrunt)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs)
* [`pre-commit`](https://github.com/pre-commit/pre-commit)
* [`pre-commit-terraform`](https://github.com/antonbabenko/pre-commit-terraform)
