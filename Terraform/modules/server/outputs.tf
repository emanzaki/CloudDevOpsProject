output "ivolve_server_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value = aws_instance.ivolve_server.public_ip
}

output "ivolve_server_id" {
  description = "ID of the Jenkins EC2 instance"
  value = aws_instance.ivolve_server.id
}

output "server_sg_id" {
  description = "ID of Server security group"
  value = aws_security_group.ivolve-sg.id
}