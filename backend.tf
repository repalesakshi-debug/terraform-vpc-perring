terraform {
  backend "s3" {
    bucket = "terraform-bucket-sakshi-2"

    key    = "Networking/fctp/dev/vpc-perring/demo/terraform.tfstate"

    region = "eu-west-3"
  }
}