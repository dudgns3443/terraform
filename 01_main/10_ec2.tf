data "aws_ami" "amzn" {
  most_recent = true
  
  filter {
    name  = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "yh_web" {
    ami = data.aws_ami.amzn.id
    instance_type = var.inst_type
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.yh_websg.id]
    availability_zone = "${var.seoul}${var.az[0]}"
    private_ip = var.instance_private_ip
    subnet_id = aws_subnet.yh_pub[0].id
    user_data = file(var.userdata)
}

resource "aws_eip" "yh_eip"{
    vpc = true
    instance = aws_instance.yh_web.id
    associate_with_private_ip = var.instance_private_ip
    depends_on = [aws_internet_gateway.yh_ig]
}

output "public_ip" {
    value = aws_instance.yh_web.public_ip
}