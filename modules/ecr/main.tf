resource "aws_ecr_repository" "sandbox_repository" {
  name = var.registry_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = var.encryption_type
  }
}