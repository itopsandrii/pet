terraform {
    required_version = ">= 1.9.0"
    required_providers {
      kind = {
        source  = "tehcyx/kind"
        version = ">= 0.8.0"
      }
      github = {
        source  = "integrations/github"
        version = ">= 5.50.0"
      }
      flux = {
        source  = "fluxcd/flux"
        version = ">= 1.5"
      }
      helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    }
        
}