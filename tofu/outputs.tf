output "public_key_openssh" {
  value = module.tls_keys.public_key_openssh
}

output "private_key_pem" {
  sensitive = true
  value     = module.tls_keys.private_key_pem
}

#output "client_key" {
#  value = module.kind_cluster.client_key
#}

#output "endpoint" {
#  value = module.kind_cluster.endpoint
#}