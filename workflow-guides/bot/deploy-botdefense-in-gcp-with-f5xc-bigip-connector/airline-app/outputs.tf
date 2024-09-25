output "app_service_ip" {
  value = data.kubernetes_service.app.0.spec.external_ips[0]
}