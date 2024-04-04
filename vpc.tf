resource "aws_vpc" "sportbet-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.sportbet-vpc.id
}

