output "client_key" {
  value = kind_cluster.app.client_key
}

output "ca" {
  value = kind_cluster.app.cluster_ca_certificate
}

output "crt" {
  value = kind_cluster.app.client_certificate
}

output "endpoint" {
  value = kind_cluster.app.endpoint
}