/*
resource "aws_ecr_repository" "ecs_app" {
  name                 = var.aws_ecr_repository
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env" = var.stage
  }
}
*/