
variable "aws_access_key" {
    default     = "jani-key"
}

variable "b64_aws_secret_key" {
    default     = "false"
}


variable "aws_az" {
  default = "ap-south-1a"
}

/*
resource "volterra_cloud_credentials" "aws_cred" {
  name      = format("%s-cred", var.site_name)
  namespace = "system"
  aws_secret_key {
    access_key = var.aws_access_key
    secret_key {
      clear_secret_info {
        url = format("string:///%s", var.b64_aws_secret_key)
      }
    }
  }
}
*/

resource "volterra_aws_vpc_site" "site" {
  count      = var.aws_ce_site ? 1 : 0
  name       = var.site_name
  namespace  = "system"
  aws_region = local.aws_region
  ssh_key    = var.ssh_key
  aws_cred {
    name      = "aws-chthonda-mktg"
    namespace = "system"
  }
  instance_type = "t3.xlarge"
  vpc {
    vpc_id=local.vnet_name
  }
  ingress_gw {
    aws_certified_hw = "aws-byol-voltmesh"
    az_nodes {
      aws_az_name = var.aws_az
      disk_size   = 20
      local_subnet {
        existing_subnet_id = local.subnet_id
      }
    }
  }
  logs_streaming_disabled = true
  no_worker_nodes         = true
}

resource "volterra_tf_params_action" "apply_aws_vpc" {
  site_name        = volterra_aws_vpc_site.site[0].name
  site_kind        = "aws_vpc_site"
  action           = "apply"
  wait_for_action  = true
  ignore_on_update = true
}
