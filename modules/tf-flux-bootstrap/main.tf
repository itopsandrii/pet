resource "kubernetes_namespace" "flux" {
    metadata {
        name = var.namespace
    }
}

resource "helm_release" "flux" {
  name       = "flux"
  namespace  = kubernetes_namespace.flux.metadata[0].name
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"
  version    = var.flux_version
  create_namespace = false

  values = [
    yamlencode({
      installCRDs = true
    })
  ]
}

resource "kubernetes_secret" "flux_ssh" {
  metadata {
    name      = "flux-git-deploy"
    namespace = var.namespace
  }
  data = {
    "identity" = base64encode(var.private_key)
  }
  type = "Opaque"
}

