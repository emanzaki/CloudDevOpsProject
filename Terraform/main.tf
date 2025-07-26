module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  mytag = var.mytag
  public_subnet_cidrs = var.public_subnet_cidrs
  aws_region = var.aws_region
  
}

module "server" {
  source = "./modules/server"
  instance_type = var.instance_type
  mytag = var.mytag
  ami = var.ami
  public_subnet_id = module.network.public_subnet_id
  vpc_id = module.network.vpc_id
  alarm-notify_email = var.alarm_notify_email
}

// saving instance ip in file

resource "local_file" "ivolve_server_ip" {
  content = module.server.ivolve_server_ip
  filename = "${path.module}/ivolve_ip.txt"
  
}