resource "aws_ecs_service" "web_server_service" {
  name            = "web-server-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.web_server_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    security_groups = [aws_security_group.alb_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.web_server_tg_ip.arn
    container_name   = "web-server"
    container_port   = 80
  }

  depends_on = [
    aws_lb_listener.web_server_listener,
  ]
}
