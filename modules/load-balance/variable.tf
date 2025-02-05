variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal or internet-facing."
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of security group IDs associated with the load balancer."
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs in which to create the load balancer."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the load balancer and target group will be created."
  type        = string
}

variable "enable_deletion_protection" {
  description = "Flag to enable deletion protection for the load balancer."
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Flag to enable cross-zone load balancing."
  type        = bool
  default     = true
}

variable "target_group_port" {
  description = "Port on which the target group will listen."
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol to use for the target group."
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path to use for health checks for the target group."
  type        = string
  default     = "/"
}

variable "target_id" {
  description = "ID of the target to attach to the load balancer."
  type        = string
}

variable "target_port" {
  description = "Port on the target to forward traffic to."
  type        = number
  default     = 80
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener."
  type        = string
  default     = ""
}
