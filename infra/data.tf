data "aws_ecr_repository" "repo" {
  name = "newput/node-terraform"
}

data "template_file" "env" {
  template = file("${path.module}/templates/env.json.tmpl")
  count    = length(var.env_config)
  vars = {
    name  = element(keys(var.env_config), count.index)
    value = element(values(var.env_config), count.index)
  }
}

data "template_file" "secrets" {
  template = file("${path.module}/templates/secret.json.tmpl")
  count    = length(var.secret_arns)
  vars = {
    name = element(keys(var.secret_arns), count.index)
    arn  = element(values(var.secret_arns), count.index)
  }
}
