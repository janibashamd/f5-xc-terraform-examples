locals {
  bigip_password  = data.tfe_outputs.bigip.values.bigip_password
  app_ip          = data.tfe_outputs.f5-air.values.app_ip
  bigip_ip        = data.tfe_outputs.bigip.values.bigip_public_addresses.0.0.0
}