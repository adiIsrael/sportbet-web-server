resource "aws_ecs_task_definition" "web_server_task" {
  family                   = "web-server-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "web-server",
      image     = "619312328382.dkr.ecr.us-east-1.amazonaws.com/sportbet-web-server:${var.docker_image_tag}",
      cpu       = 128,
      memory    = 256,
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          protocol      = "tcp"
        }
      ]
    }
  ])
}

variable "docker_image_tag" {
  description = "The tag of the Docker image to deploy"
  type        = string
}
