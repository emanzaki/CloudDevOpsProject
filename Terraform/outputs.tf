output "fortstak_instance_id" {
  value = aws_instance.fortstak.id
  description = "The ID of the FortStak instance"
}

output "fortstak_public_ip" {
  value = aws_instance.fortstak.public_ip
  description = "The public IP address of the FortStak instance"
}