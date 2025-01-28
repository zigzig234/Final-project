provider "kubernetes" {
  config_path = "~/.kube/config"
}


resource "kubernetes_manifest" "my_app" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      name      = "hello-world-app"
      namespace = "Final"
    }
    spec = {
      replicas = 2
      selector = {
        matchLabels = {
          app = "hello-world-app"
        }
      }
      template = {
        metadata = {
          labels = {
            app = "hello-world-app"
          }
        }
        spec = {
          containers = [
            {
              name  = "hello-world-app"
              image = "zigziglar234/hello-world-app:latest"
              ports = [
                {
                  containerPort = 5000
                }
              ]
            }
          ]
        }
      }
    }
  }
  depends_on = [helm_release.argo_cd]
}
