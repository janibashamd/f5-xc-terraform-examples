output "app_service_ip" {
  value = kubectl_manifest.app-service.spec.externalIPs[0]
}