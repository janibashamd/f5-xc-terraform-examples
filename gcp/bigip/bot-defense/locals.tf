locals {
  bigip_password  = data.tfe_outputs.bigip.bigip_password
  app_ip          = data.tfe_outputs.f5-air.values.app_ip
  bigip_ip        = data.tfe_outputs.bigip.bigip_public_addresses.0
}