output "app_service_ip" {
  value = data.kubernetes_service.app.spec.external_ips[0]
}