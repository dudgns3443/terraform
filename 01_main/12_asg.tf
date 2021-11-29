resource "aws_ami_from_instance" "yh_ami" {
  name               = "wordpressAMIterra"
  source_instance_id = aws_instance.yh_web.id
  depends_on = [
    aws_instance.yh_web
  ]
}

resource "aws_launch_configuration" "yh_conf" {
  name_prefix   = "terraform-lc-example"
  image_id      = aws_ami_from_instance.yh_ami.id
  instance_type = var.inst_type
  iam_instance_profile = var.role_ec2
  security_groups = [aws_security_group.yh_websg.id]
  key_name = var.key
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "yh_pg" {
  name     = "pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "yh_asg" {
  name = "asg"
  min_size = var.asg_min_size
  max_size = var.asg_max_size
  health_check_grace_period = var.heath_check_period
  health_check_type = var.health_check_type
  desired_capacity = var.asg_desired_capacity
  force_delete = false
  #placement_group = aws_placement_group.yh_pg.id
  launch_configuration = aws_launch_configuration.yh_conf.name
  vpc_zone_identifier = [aws_subnet.yh_pub[0].id,aws_subnet.yh_pub[1].id]
  target_group_arns = [aws_lb_target_group.yh_tg.arn]
}

