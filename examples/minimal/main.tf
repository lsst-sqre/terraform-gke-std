module "gke" {
  source         = "github.com/lsst-sqre/terraform-gke-std"
  name           = "${data.template_file.gke_cluster_name.rendered}"
  google_project = "${var.google_project}"
}
