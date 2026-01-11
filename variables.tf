variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
  default = ""
}

variable "github_owner" {
  description = "GitHub organization or user"
  type        = string
  default = "Riddhi"
}

variable "repository_name" {
  description = "GitHub repository name"
  type        = string
  default = "myFirstProject"
}

variable "repositories" {
  type = set(string)
  default = [ "myTerraformProject"]
}