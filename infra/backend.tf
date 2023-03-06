terraform {
  backend "s3" {
    bucket         = "newput-dev.terraform"
    key            = "node-terraform-api.dev.tfstate"
    dynamodb_table = "newput-dev.terraform"
    region         = "us-west-2"
  }
}
