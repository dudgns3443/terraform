provider "aws"{
    region = var.seoul
    
}

resource "aws_vpc" "yhkim_vpc" {
  cidr_block = var.cidr_main
}
