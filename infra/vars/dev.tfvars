stage        = "dev"
cluster_name = "newput-dev"
aws_vpc_name = "newput-dev"
# dns_role        = "arn:aws:iam::855787389747:role/tuvoli-dev-Route53FullAccess"
# record_name     = "dev-new-logger-service.flightcommand.com"


env_vars = {
  NODE_ENV = "developmet",
  DB_NAME  = "test_db"
}

secret_arns = {
  DB_PASSWORD = "arn:aws:secretsmanager:us-west-2:708980201424:secret:newput/dev/db_password-reB9nJ"
}
