resource "aws_db_instance" "yh_db"{
    allocated_storage= var.db_storage_size
    storage_type = var.db_storage_type
    engine = var.db_engine
    engine_version = var.db_engine_ver
    instance_class = var.db_inst_class
    name = var.db_init_name
    identifier = var.db_identifier
    username = var.db_username
    password = var.db_password
    parameter_group_name = var.db_param_grp_name
    availability_zone = "${var.seoul}${var.az[0]}"
    db_subnet_group_name = aws_db_subnet_group.db_subnet.name
    skip_final_snapshot = true
}
resource "aws_db_subnet_group" "db_subnet" {
  name = var.db_subnet_name
  subnet_ids = [aws_subnet.yh_pridb[0].id,aws_subnet.yh_pridb[1].id]
}