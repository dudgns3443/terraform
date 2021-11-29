resource "aws_eip" "yh_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "yh_ng" {
  allocation_id = aws_eip.yh_eip_ng.id
  subnet_id     = aws_subnet.yh_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }
  depends_on = [
    aws_internet_gateway.yh_ig
  ]
}

resource "aws_route_table" "yh_ngrt" {
  vpc_id = aws_vpc.yhkim_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.yh_ng.id
  }

  tags = {
    "Name" = "yh-ngrt"
  }
}

resource "aws_route_table_association" "yh_ngass" {
  count = length(var.pri_cidr)
  subnet_id      = aws_subnet.yh_pri[count.index].id
  route_table_id = aws_route_table.yh_ngrt.id
}