variable "launch_configuration_name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "security_groups" {
  type = list(string)
}

variable "key_name" {
  type    = string
  default = ""
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_name" {
  type = string
}
