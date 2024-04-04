resource "aws_lb_target_group" "web_server_tg_ip" {
  name     = "web-server-tg-ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sportbet-vpc.id
  target_type = "ip"

  health_check {
    enabled = true
    path    = "/"
    protocol = "HTTP"
  }
}