resource "aws_subnet" "yh_puba" {
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "yhkim-puba"
  }
}

resource "aws_subnet" "yh_pubc" {
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "yhkim-pubc"
  }
}

resource "aws_subnet" "yh_pridba" {
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = "10.2.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "yh-pridba"
  }
}


resource "aws_subnet" "yh_pridbc" {
  vpc_id            = aws_vpc.yhkim_vpc.id
  cidr_block        = "10.2.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "yh-pridbc"
  }
}