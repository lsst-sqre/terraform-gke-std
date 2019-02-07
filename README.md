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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gke\_version | gke master/node version | string | `"latest"` | no |
| google\_project | google cloud project ID | string | `"plasma-geode-127520"` | no |
| google\_region | google cloud region | string | `"us-central1"` | no |
| google\_zone | google cloud region/zone | string | `"us-central1-b"` | no |
| initial\_node\_count | number of gke nodes to start | string | `"3"` | no |
| machine\_type | machine type of default gke pool nodes | string | `"n1-standard-1"` | no |
| name | gke cluster name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| client\_certificate |  |
| client\_key |  |
| cluster\_ca\_certificate |  |
| host |  |
| id |  |

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
