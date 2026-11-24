terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket  = "my-ts-bucket-practice"
    key     = "voting-app/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # This replaces the using dynamo db
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region
}
