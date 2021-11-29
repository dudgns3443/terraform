resource "aws_subnet" "yh_pub" {
  count = length(var.pub_cidr)
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = var.pub_cidr[count.index]
  availability_zone = "${var.seoul}${var.az[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.az[count.index]}"
  }
}

resource "aws_subnet" "yh_pri" {
  count = length(var.pri_cidr)
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = var.pri_cidr[count.index]
  availability_zone = "${var.seoul}${var.az[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.az[count.index]}"
  }
}

resource "aws_subnet" "yh_pridb" {
  count = length(var.db_cidr)
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = var.db_cidr[count.index]
  availability_zone = "${var.seoul}${var.az[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.az[count.index]}"
  }
}