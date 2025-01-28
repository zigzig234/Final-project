terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11" 
    }
  }
}

provider "kind" {}

resource "kind_cluster" "local" {
  name = "kind-kind1"
  wait_for_ready = true 
}

output "kubeconfig" {
  value = kind_cluster.local.kubeconfig
}

