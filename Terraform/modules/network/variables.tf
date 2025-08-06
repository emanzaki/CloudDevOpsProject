variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "mytag" {
  description = "Tag name for resources"
  type        = string
}

variable "aws_region" {
  description = "The region to the resources"
  type = string
}