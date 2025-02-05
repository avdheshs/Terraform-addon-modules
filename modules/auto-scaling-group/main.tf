resource "aws_launch_configuration" "example" {
  name          = var.launch_configuration_name
  image_id      = var.image_id
  instance_type = var.instance_type
  security_groups = var.security_groups

  lifecycle {
    create_before_destroy = true
  }

  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}

resource "aws_autoscaling_group" "example" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  launch_configuration = aws_launch_configuration.example.id
  vpc_zone_identifier  = var.subnet_ids

  health_check_type          = "EC2"
  health_check_grace_period = 300
  wait_for_capacity_timeout  = "0"

  tags = [
    {
      key                 = "Name"
      value               = var.instance_name
      propagate_at_launch = true
    }
  ]
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
}

output "launch_configuration_name" {
  value = aws_launch_configuration.example.name
}
