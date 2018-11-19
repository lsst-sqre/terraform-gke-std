Minimal example of using terraform-gke-std
===

This is intended to be a "bare bones" example of starting up a gke cluster
using `terraform-gke-std`.

Prerequisites
---

A working gcloud installation or a "service account key" file and the env var
[`GOOGLE_CLOUD_KEYFILE_JSON`](https://www.terraform.io/docs/providers/google/getting_started.html#adding-credentials)
declared pointing to it.

See the gcloud
[authenication/getting-started](https://cloud.google.com/docs/authentication/getting-started)
page for details on setting up a service account and downloading a "service
account key" file.

The "Kubernetes Engine Clsuter Admin" role is known to work.

```
Role -> Kubernetes Engine -> Kubernetes Engine Cluster Admin
```

Example
---

```bash
cd examples/minimal
export GOOGLE_CLOUD_KEYFILE_JSON=$(pwd)/sqre-d286b17c23f4.json
export TF_VAR_env_name="${USER}-test"
make
make tf-init
./bin/terraform plan
./bin/terraform apply
```
