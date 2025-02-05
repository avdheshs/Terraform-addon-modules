output "load_balancer_arn" {
  description = "The ARN of the load balancer."
  value       = aws_lb.example.arn
}

output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.example.dns_name
}
