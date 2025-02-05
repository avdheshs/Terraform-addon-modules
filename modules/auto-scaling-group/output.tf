output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
}

output "launch_configuration_name" {
  value = aws_launch_configuration.example.name
}
