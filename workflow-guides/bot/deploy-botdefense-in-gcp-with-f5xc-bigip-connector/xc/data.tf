data "tfe_outputs" "infra" {
  organization  = var.tf_cloud_organization
  workspace     = "gcp-infra"
}

locals {
  project_prefix = data.tfe_outputs.infra.values.project_prefix
}
