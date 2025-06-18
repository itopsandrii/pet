module "tls_keys" {
  source = "../modules/tf-tls-keys"
}

module "kind_cluster" {
  source       = "../modules/tf-kind-cluster"
  cluster_name = var.cluster_name
}

module "flux-bootstrap" {
  source      = "../modules/tf-flux-bootstrap"
  private_key = module.tls_keys.private_key_pem
}

resource "flux_git_repository" "kbot" {
  name      = "kbot-git"
  namespace = "flux-system"
  url       = "https://github.com/itopsandrii/kbot.git"
  branch    = "develop"
  interval  = "1m0s"
}

resource "flux_helm_release" "kbot" {
  name      = "kbot"
  namespace = "default"
  interval  = "1m0s"
  chart = {
    spec = {
      chart = "./helm"
      sourceRef ={
        kind = "GitRepository"
        name = flux_git_repository.kbot.name
        namespace = "flux-syste"
      }
    }
  }
  depends_on = [flux_git_repository.kbot]
}