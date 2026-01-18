
provider "github" {}

resource "github_repository" "repos" {
  for_each               = var.repositories
  name                   = each.value
  delete_branch_on_merge = true
}

resource "github_repository_ruleset" "branch_naming" {
  for_each    = var.repositories
  name        = "jira-branch-naming"
  repository  = github_repository.repos[each.key].name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["refs/heads/jira-*"]
      exclude = [
        "refs/tags/*",
        "refs/heads/*v*.*.*",
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
