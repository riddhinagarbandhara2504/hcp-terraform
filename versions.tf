terraform {
  cloud {
    organization = "Riddhi-test"

    workspaces {
      name = "github-branch-rules"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}