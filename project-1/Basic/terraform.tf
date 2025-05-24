terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }

  backend "s3" {   
    bucket = "kaab-saleem-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "TWS-junoon-state-table"
  }
}