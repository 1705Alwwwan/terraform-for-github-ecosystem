variable "repo_name" {
  type        = string
  description = "Nama repositori GitHub yang akan dibuat"
}

variable "description" {
  type        = string
  description = "Deskripsi dari repositori"
  default     = "Managed by Terraform"
}

variable "visibility" {
  type        = string
  description = "Tingkat visibilitas repositori (public atau private)"
  default     = "private"

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility harus bernilai 'public' atau 'private'."
  }
}

variable "auto_init" {
  type        = bool
  description = "Inisialisasi repositori dengan README.md"
  default     = true
}

variable "enable_branch_protection" {
  type        = bool
  description = "Aktifkan aturan branch protection untuk branch main"
  default     = true
}

variable "required_approving_review_count" {
  type        = number
  description = "Jumlah review minimum untuk PR sebelum me-merge"
  default     = 1
}

variable "webhook_url" {
  type        = string
  description = "URL webhook (opsional, kosongkan jika tidak digunakan)"
  default     = ""
}