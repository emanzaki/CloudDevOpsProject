variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
}
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
}

variable "mytag" {
  description = "Tag name for resources"
  type = string
}

variable "alarm-notify_email" {
  description = "Email address to receive CloudWatch alarm notifications"
  type = string
}

variable "public_subnet_id" {
  description = "CIDR blocks for public subnet"
  type = string
  
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}