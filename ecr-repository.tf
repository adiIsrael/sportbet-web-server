resource "aws_ecr_repository" "sportbet_web_server" {
  name                 = "sportbet-web-server"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "Development"
    Project     = "Sportbet"
  }
}
