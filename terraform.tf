terraform {
  backend "s3" {
    bucket = "sujv-terraform"
    key    = "sujv-state-file/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
