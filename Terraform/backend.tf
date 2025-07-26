terraform {
  backend "s3" {
    bucket         = "ez-ivolve-state-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
  }
}