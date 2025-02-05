resource "aws_lb" "example" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups   = var.security_groups
  subnets            = var.subnets
  enable_deletion_protection = var.enable_deletion_protection

  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "example" {
  name     = "${var.lb_name}-target-group"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      message_body = "OK"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.example.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      message_body = "OK"
    }
  }

  certificate_arn = var.ssl_certificate_arn
}

resource "aws_lb_target_group_attachment" "example" {
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = var.target_id
  port             = var.target_port
}

output "load_balancer_arn" {
  value = aws_lb.example.arn
}

output "load_balancer_dns_name" {
  value = aws_lb.example.dns_name
}
