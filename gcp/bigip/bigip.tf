module "bigip-module_example_bigip_gcp_1nic_deploy" {
  source            = "F5Networks/bigip-module/gcp//examples/bigip_gcp_1nic_deploy"
  version           = "1.1.19"
  # insert the 4 required variables here
  image             = ""
  project_id        = local.project_id
  region            = local.region
  service_account   = local.service_account
}