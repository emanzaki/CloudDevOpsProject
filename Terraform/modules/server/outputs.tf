output "server_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.server.public_ip
}

output "server_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.server.id
}

output "server_sg_id" {
  description = "ID of Server security group"
  value = aws_security_group.sg.id
}