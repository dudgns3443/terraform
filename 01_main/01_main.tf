provider "aws"{
    region = var.seoul
    
}

resource "aws_vpc" "yhkim_vpc" {
  cidr_block = "10.2.0.0/16"  
}

# resource "aws_instance" "web" {
#     ami             = "ami-003ef1c0e2776ea27"
#     instance_type   = "t2.micro"
#     availability_zone = "ap-northeast-2a"
#     tags = {
#         "Name" = "web-1"
#     }
#     key_name = "lab7key"
#     user_data = file("userdata.sh")
# }

# output "public_ip" {
#   value       = aws_instance.web.public_ip
# #   sensitive   = true
# #   description = "description"
# #   depends_on  = []
# }
