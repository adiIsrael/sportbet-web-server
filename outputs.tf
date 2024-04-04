output "network_configuration" {
  value = {
    subnet_ids        = aws_ecs_service.web_server_service.network_configuration[*].subnets[*]
    security_group_id = aws_ecs_service.web_server_service.network_configuration[*].security_groups[*]
  }
}



output "vpc_info" {
  value = {
    vpc_id          = aws_vpc.sportbet-vpc.id
    subnet_ids      = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    subnet_vpcs     = [aws_subnet.subnet1.vpc_id, aws_subnet.subnet2.vpc_id]
    security_group  = aws_security_group.alb_sg.id
    security_group_vpc = aws_security_group.alb_sg.vpc_id
    alb_id          = aws_lb.web_server_lb.id
    alb_vpc         = aws_lb.web_server_lb.vpc_id
  }
}

output "internet_gateway_id" {
  value = aws_internet_gateway.ig.id
  description = "The ID of the Internet Gateway attached to the VPC"
}
