resource "aws_subnet" "public_subnet" {
  count      = length(var.public_subnets_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnets_cidrs, count.index)

  tags = {
    Name = "${var.public_subnet_name}-${count.index + 1}"
  }
}
