# Specify the provider and access details
terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "dns"
  region = var.aws_region

  assume_role {
    role_arn = var.dns_role
  }
}
