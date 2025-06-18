output "flux_helm_status" {
  description = "Status of the Flux Helm release"
  value       = helm_release.flux.status
}
