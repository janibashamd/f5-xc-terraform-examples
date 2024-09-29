module bigip {
  count           = 1
  source          = "F5Networks/bigip-module/gcp"
  prefix          = local.project_prefix
  project_id      = local.project_id
  zone            = local.region
  image           = var.image
  service_account = local.service_account
  #f5_password     = var.bigip_password
  mgmt_subnet_ids = [{ "subnet_id" = local.subnet_name, "public_ip" = true, "private_ip_primary" = "" }]
}