output "app_id" {
  value = volterra_http_loadbalancer.lb_https.cname
}

output "tenant_id" {
  value = var.xc_tenant
}

output "api_key" {
  value = var.xc_tenant
}

