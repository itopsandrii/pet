provider "kind" {}
provider "github" {
    token = var.github_token
    owner = "itopsandrii"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    #host                   = module.kind_cluster.endpoint
    #client_certificate     = module.kind_cluster.client_certificate
    #client_key             = module.kind_cluster.client_key
    #cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
  }
}
provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
  git = {
    url = "https://github.com/itopsandrii/pet.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
  # 
  # git = {
  #   url = "ssh://git@github.com:itopsandrii/pet.git"
  #   ssh = {
  #     username = "git"
  #     private_key = var.flux_private_key
  #   }
  # }
}
