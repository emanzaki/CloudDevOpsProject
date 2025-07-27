variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  default     = "ami-08a6efd148b1f7504"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default = "t2.micro"
}

variable "fort-tag" {
  description = "Environment name for resource naming"
  type        = string
  default     = "fortstak"
}
