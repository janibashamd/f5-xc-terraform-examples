locals {
  project_id      = data.tfe_outputs.gcp-infra.values.gcp_project_id
  region          = data.tfe_outputs.gcp-infra.values.gcp_region
  network_name    = data.tfe_outputs.gcp-infra.values.vpc_name
  subnet_name     = data.tfe_outputs.gcp-infra.values.vpc_subnet
  subnet_id       = nonsensitive( data.tfe_outputs.gcp-infra.values.vpc_subnet_id)
  #subnet_id       = "projects/f5-gcs-5611-mktg-secsols/regions/asia-south1/subnetworks/jani-bd-subnet-ba9f"
  project_prefix  = data.tfe_outputs.gcp-infra.values.project_prefix
  service_account = data.tfe_outputs.gcp-infra.values.service_account
}