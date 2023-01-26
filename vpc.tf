resource "aws_vpc" "vpc_for_es" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc_for_es"
  }

}
