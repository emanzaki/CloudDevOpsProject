terraform {
  backend "s3" {
    bucket         = "ezm-state-bucket-tf"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
  }
}