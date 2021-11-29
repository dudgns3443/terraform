variable "seoul" {
    type = string
    default = "ap-northeast-2"

}

variable "key" {
    type = string
    default = "lab7key"
}

variable "cidr_main"{
    type = string
    default  = "10.2.0.0/16"
}

variable "name" {
    type = string
    default = "yh"
}

variable "pub_cidr" {
    type = list
    default = ["10.2.0.0/24","10.2.1.0/24"]
}

variable "pri_cidr" {
    type = list
    default = ["10.2.2.0/24","10.2.3.0/24"]
}

variable "db_cidr" {
    type = list
    default = ["10.2.4.0/24","10.2.5.0/24"]
}

variable "az" {
    type = list
    default = ["a","c"]
}

variable "cidr_route" {
    type = string
    default = "0.0.0.0/0"
}

variable "cidr_global" {
    default = "0.0.0.0/0"
}

variable "port_db" {
    default = 3306
}

variable "cidr_globalv6" {
    default = "::/0"
}

variable "inst_type" {
    default = "t2.micro"
}

variable "instance_private_ip" {
    default = "10.2.0.11"
}
variable "userdata"{
    default = "wordpress.sh"
}

variable "protocol_tg" {
    default = "HTTP"
}

variable "port_http" {
    default = 80
}

variable "port_ssh" {
    default = 22
}

variable "path_health_check" {
    default = "/health.html"
}

variable "status_code_suc"{
    default = "200"
}

variable "role_admin"{
    default = "admin_role"
}

variable "role_ec2" {
    default = "admin_role"
}

variable "asg_min_size" {
    default = 2
}


variable "asg_max_size" {
    default = 4
}
variable "heath_check_period" {
    default = 60
}

variable "asg_desired_capacity"{
    default = 2
}

variable "health_check_type" {
    default = "EC2"
}

variable "db_storage_size" {
    default = 20
}

variable "db_storage_type" {
    default = "gp2"
}

variable "db_engine" {
    default = "mysql"
}

variable "db_engine_ver" {
    default = "8.0"
}

variable "db_inst_class" {
    default = "db.t2.micro"
}

variable "db_init_name" {
    default = "wordpress"
}

variable "db_identifier" {
    default = "database-1"
}

variable "db_username" {
    default = "admin"
}

variable "db_password" {
    default = "c6553443"
}

variable "db_subnet_name" {
    default = "db-subnet2"
}

variable "db_param_grp_name" {
    default = "default.mysql8.0"
}

variable "description" {
    default = {
        ssh = "Allow ssh global",
        http = "Allow http global",
        mysql = "Allow mysql global",
        icmp = "Allwo icmp ALL"
    }
}
