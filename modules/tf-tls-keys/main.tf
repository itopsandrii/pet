resource "tls_private_key" "flux" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
