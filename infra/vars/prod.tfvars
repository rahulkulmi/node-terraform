stage        = "prod"
cluster_name = "newput-prod"
aws_vpc_name = "newput-dev"
# dns_role        = "arn:aws:iam::855787389747:role/tuvoli-dev-Route53FullAccess"
# record_name     = "dev-new-logger-service.flightcommand.com"


env_vars = {
  NODE_ENV = "production",
  DB_NAME  = "prod_test_db"
}

secret_arns = {
  DB_PASSWORD = "arn:aws:secretsmanager:us-west-2:708980201424:secret:newput/prod/db_password-UsmySn"
}
