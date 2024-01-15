terraform {
  backend "s3" {
    bucket = "application-remote-backend"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}