resource "aws_ecs_task_definition" "web_server_task" {
  family                   = "web-server-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "web-server",
      image     = "619312328382.dkr.ecr.us-east-1.amazonaws.com/sportbet-web-server:latest",
      cpu       = 128,
      memory    = 256,
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80,
          protocol      = "tcp"
        }
      ]
    }
  ])
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.web_server_task.arn
  description = "ARN of the ECS Task Definition for the web server"
}
