
#TF Cloud
variable "tf_cloud_organization" {
  type        = string
  description = "TF cloud org (Value set in TF cloud)"
}

variable "ssh_key" {
  type        = string
  description = "SSH pub key, only present for warning handling with TF cloud variable set"
}

#XC
variable "xc_tenant" {
  type        = string
  description = "Your F5 XC tenant name" 
}

variable "api_url" {
  type        = string
  description = "Your F5 XC tenant api url"
}

variable "xc_namespace" {
  type        = string
  description = "Volterra app namespace where the object will be created. This cannot be system or shared ns."
}
