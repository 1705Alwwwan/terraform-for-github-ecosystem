# 1. Membuat Repositori GitHub
resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.description
  visibility  = var.visibility
  auto_init   = var.auto_init

  has_issues   = true
  has_projects = true
  has_wiki     = false

  vulnerability_alerts = true
}

# 2. Aturan Branch Protection (Hanya dibuat jika enable_branch_protection = true)
resource "github_branch_protection" "main" {
  count         = var.enable_branch_protection ? 1 : 0
  repository_id = github_repository.repo.node_id
  pattern       = "main"

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = var.required_approving_review_count
  }

  enforce_admins = false
}

# 3. Webhook Repositori (Hanya dibuat jika webhook_url diisi)
resource "github_repository_webhook" "webhook" {
  count      = var.webhook_url != "" ? 1 : 0
  repository = github_repository.repo.name

  configuration {
    url          = var.webhook_url
    content_type = "json"
    insecure_ssl = false
  }

  active = true
  events = ["push", "pull_request"]
}