module bigip {
  count           = 1
  source          = "F5Networks/bigip-module/gcp"
  prefix          = local.project_prefix
  project_id      = local.project_id
  zone            = local.region
  image           = var.image
  service_account = local.service_account
  f5_password     = var.bigip_password
  vm_name         = "${local.project_prefix}-bigip"
  network_tags    = ["bigip"]
  mgmt_subnet_ids = [{ "subnet_id" = "projects/f5-gcs-5611-mktg-secsols/regions/asia-south1/subnetworks/jani-bd-subnet-ba9f", "public_ip" = true, "private_ip_primary" = "" }]
}

# firewall rules
resource "google_compute_firewall" "allow-ports" {
  name          = "${local.project_prefix}-allow"
  network       = local.network_name
  allow {
    protocol    = "tcp"
    ports       = ["22", "80", "443", "8443"]
  }
  allow {
    protocol    = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bigip"]
}