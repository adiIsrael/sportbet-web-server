resource "aws_instance" "ecs_instance" {
  ami           = "ami-0dc67873410203528"
  instance_type = "t2.micro"
  key_name      = "sportbet_ecs_task"
  vpc_security_group_ids = [aws_security_group.ecs_instance_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=sportbet-ecs-cluster >> /etc/ecs/ecs.config
    EOF

  tags = {
    Name = "ECS Instance"
  }
}