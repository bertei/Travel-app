variable "ecr_repo_name" {
  type        = string
  description = "ECR Repository name"
}

variable "mutability" {
  type        = bool
  description = "Enables/disables mutability (ability to change image tag)"
  default     = false
}