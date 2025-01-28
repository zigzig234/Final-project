provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  namespace  = "Final"
  create_namespace = true

  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.35.0"

  values = [
    <<EOF
    server:
      service:
        type: NodePort
    EOF
  ]
  depends_on = [kind_cluster.local]
}
