resource "aws_key_pair" "ecs_key_pair" {
  key_name   = "sportbet_ecs_task"
  public_key = file("/Users/Temp_noc/.ssh/sportbet_ecs_task.pub")
}
