# 1. URL Repositori di Browser
output "repository_html_url" {
  description = "URL web untuk mengakses repositori GitHub"
  value       = github_repository.repo.html_url
}

# 2. SSH Clone URL
output "repository_ssh_clone_url" {
  description = "URL SSH untuk melakukan git clone"
  value       = github_repository.repo.ssh_clone_url
}

# 3. HTTPS Clone URL
output "repository_http_clone_url" {
  description = "URL HTTPS untuk melakukan git clone"
  value       = github_repository.repo.http_clone_url
}

# 4. Status Branch Protection
output "branch_protection_enabled" {
  description = "Status apakah branch protection diaktifkan"
  value       = var.enable_branch_protection
}

# 5. Webhook URL (jika dipasang)
output "webhook_url" {
  description = "URL webhook yang dikonfigurasi pada repositori"
  value       = length(github_repository_webhook.webhook) > 0 ? github_repository_webhook.webhook[0].configuration[0].url : "Tidak ada webhook yang dibuat"
}