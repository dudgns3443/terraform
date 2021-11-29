resource "aws_lb" "yh_alb" {
    name = "${var.name}-alb"
    internal =false
    load_balancer_type = "application"
    security_groups = [aws_security_group.yh_websg.id]
    subnets = [aws_subnet.yh_pub[0].id,aws_subnet.yh_pub[1].id]
    
}

resource "aws_lb_target_group" "yh_tg" {
    name = "wordpressTG"
    port = var.port_http
    protocol = var.protocol_tg
    vpc_id = aws_vpc.yhkim_vpc.id

    health_check {
        enabled               = true
        healthy_threshold     = 3
        interval              = 5
        matcher               = var.status_code_suc
        path                  = var.path_health_check 
        port                  = "traffic-port"
        protocol              = var.protocol_tg
        timeout               = 2
        unhealthy_threshold   = 2 
    }
}

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.yh_tg.arn
#   target_id        = aws_instance.yh_web.id
#   port             = var.port_http
# }

resource "aws_lb_listener" "yh_listener" {
    load_balancer_arn = aws_lb.yh_alb.arn
    port = var.port_http
    protocol = var.protocol_tg

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.yh_tg.arn

    }
}

output "dns" {
    value = aws_lb.yh_alb.dns_name
}