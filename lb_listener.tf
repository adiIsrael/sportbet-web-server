resource "aws_lb_listener" "web_server_listener" {
  load_balancer_arn = aws_lb.web_server_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server_tg_ip.arn
  }
}

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = aws_lb.web_server_lb.arn
  port              = 80
  protocol          = "HTTP"

  /*default_action {
    type = "redirect"
    redirect {
      protocol   = "HTTPS"
      port       = "443"
      status_code = "HTTP_301"
    }
  }
}*/

/*resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.web_server_lb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08" # Default policy, adjust as needed.
  certificate_arn   = "arn:aws:acm:region:account-id:certificate/certificate-id" # Replace with your certificate ARN.

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server_tg_ip.arn
  }
}*/
