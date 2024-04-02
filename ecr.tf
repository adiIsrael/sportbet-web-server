resource "aws_ecr_repository" "web_server_repo" {
  name                 = "web-server-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}