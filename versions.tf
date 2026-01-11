terraform {
  cloud {
    organization = "YOUR_HCP_ORG"

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