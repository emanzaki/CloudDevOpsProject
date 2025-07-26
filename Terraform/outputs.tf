output "vpc_id" {
  description = "ID of the created VPC"
  value = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = module.network.igw_id
}