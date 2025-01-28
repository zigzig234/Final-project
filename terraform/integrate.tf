resource "kubernetes_manifest" "argo_app" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "hello-world-app"
      namespace = "Final"
    }
    spec = {
      project     = "default"
      source      = {
        repoURL        = "https://github.com/zigzig234/Final-project.git"
        targetRevision = "HEAD"
        path           = "app/app.py"
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "default"
      }
      syncPolicy = {
        automated = {
          prune = true
          selfHeal = true
        }
      }
    }
  }
 depends_on = [kubernetes_manifest.my_app]
}
