variable "namespace" {
    description = "FluxCD namespace"
    type        = string
    default     = "flux-system"

}

variable "flux_version" {
    description = "Helm chart version flux2"
    type        = string
    default     = "2.16.0"
}

variable private_key {
  type        = string
  sensitive   = true 
  description = "SSH private key for FluxCD"
}
