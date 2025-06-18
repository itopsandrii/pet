variable github_token {
  type        = string
  sensitive   = true 
  description = "description"
}
variable "cluster_name" {
  description = "Имя kind-кластера"
  type        = string
  default     = "pet-kind"
}