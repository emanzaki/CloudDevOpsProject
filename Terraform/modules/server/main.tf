# Generate a new SSH key pair
resource "tls_private_key" "server-pk" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "server-key" {
  key_name   = "${var.mytag}-key"
  public_key = trimspace(tls_private_key.server-pk.public_key_openssh)

}

resource "local_file" "server_private_key" {
  content = tls_private_key.server-pk.private_key_pem
  filename = "${path.root}/../server-info/${var.mytag}-key.pem"
  file_permission = "0400"  
}

resource "aws_security_group" "sg" {
  name        = "${var.mytag}-sg"
  description = "Security group for application"
  vpc_id     = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Access ArgoCD"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.server-key.key_name
  tags = {
    Name = "${var.mytag}-server"
  }
}

resource "aws_sns_topic" "alarms" {
  name = "${var.mytag}-server-alarm-topic"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol = "email"
  endpoint = var.alarm-notify_email
}

resource "aws_cloudwatch_metric_alarm" "server_cpu" {
  alarm_name = "${var.mytag}-server-high-cpu"
  comparison_operator =  "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "80"
  alarm_description = "CPU utilization has exceeded 80% for server"
  alarm_actions = [aws_sns_topic.alarms.arn]
  ok_actions = [aws_sns_topic.alarms.arn]

  dimensions = {
    InstanceId = aws_instance.server.id
  }
}

resource "aws_cloudwatch_metric_alarm" "server_mem" {
  alarm_name = "${var.mytag}-server-high-memory"
  comparison_operator =  "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "mem_used_percent"
  namespace = "CWAgent"
  period = "120"
  statistic = "Average"
  threshold = "80"
  alarm_description = "Memory utilization has exceeded 80% for server"
  alarm_actions = [aws_sns_topic.alarms.arn]
  ok_actions = [aws_sns_topic.alarms.arn]

  dimensions = {
    InstanceId = aws_instance.server.id
  }
}

resource "aws_cloudwatch_metric_alarm" "server_status" {
  alarm_name = "${var.mytag}-server-status-check-faild"
  comparison_operator =  "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "StatusCheckFailed"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Maximum"
  threshold = "1"
  alarm_description = "Server has failed status check"
  alarm_actions = [aws_sns_topic.alarms.arn]
  ok_actions = [aws_sns_topic.alarms.arn]

  dimensions = {
    InstanceId = aws_instance.server.id
  }
}