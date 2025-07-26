variable "mytag" {
  description = "Tag name for resources"
  type        = string
  default     = "ivolve"
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

variable "aws_region" {
  description = "The region to the resources"
  type = string
  default = "us-east-1"
}