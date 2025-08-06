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

output "server_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value = module.server.server_ip
}

output "server_id" {
  description = "ID of the Jenkins EC2 instance"
  value = module.server.server_id
}

output "server_sg_id" {
  description = "ID of Server security group"
  value = module.server.server_sg_id
}