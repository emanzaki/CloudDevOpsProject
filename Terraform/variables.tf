variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

// Network Module vars
variable "mytag" {
  description = "Tag name for resources"
  type        = string
  default     = "DevOps"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

// Server Module vars

variable "alarm_notify_email" {
  description = "Email address to receive CloudWatch alarm notifications"
  type        = string
  default = "emanzaki774@gmail.com"
}

variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  default     = "ami-08a6efd148b1f7504"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default = "t2.medium"
}

