provider "google" {
  project = local.project_id
  region  = local.gcp_region
}

provider "kubectl" {
    host                    = local.host
    cluster_ca_certificate  = base64decode(local.cluster_ca_certificate)
    token                   = local.cluster_token
    load_config_file        = false
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "gke-gcloud-auth-plugin"
    }
}
