  resource "aws_subnet" "subnet_for_es" {
    vpc_id            = aws_vpc.vpc_for_es.id
    cidr_block        = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
      Name : "${var.env_prefix}-subnet_for_es"
    }
  }
