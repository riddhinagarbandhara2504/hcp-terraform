# GitHub Branch Rules with HCP Terraform

This project enforces GitHub branch standards using Terraform and HCP Terraform.

## Enforced Rules

- Branch names must start with `jira-`
- Branch names cannot be tags or version-like names
- Branches are automatically deleted after PR merge

## Requirements

- GitHub Personal Access Token with:
  - repo
  - admin:repo_hook
- HCP Terraform organization

## Usage

1. Set variables in HCP Terraform workspace:
   - `github_token`
   - `github_owner`
   - `repository_name`

2. Run Terraform:
