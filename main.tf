resource "github_repository" "repo" {
  name                   = var.repository_name
  delete_branch_on_merge = true
}

resource "github_repository_ruleset" "branch_naming" {
  name        = "jira-branch-naming"
  repository  = github_repository.repo.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["refs/heads/jira-*"]
      exclude = [
        "refs/tags/*",          # Disallow tags
        "refs/heads/*v*.*.*",   # Disallow semantic version-like names
        "refs/heads/*v*.*",
        "refs/heads/*[0-9].[0-9]*"
      ]
    }
  }

  rules {
    creation = true
    update   = true
    deletion = false
  }
}
