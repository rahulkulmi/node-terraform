data "aws_ecr_repository" "repo" {
  name = "newput/node-terraform"
}

data "template_file" "env" {
  template = file("./templates/env.json.tmpl")
  count    = length(var.env_vars)
  vars = {
    name  = element(keys(var.env_vars), count.index)
    value = element(values(var.env_vars), count.index)
  }
}

data "template_file" "secrets" {
  template = file("./templates/secret.json.tmpl")
  count    = length(var.secret_arns)
  vars = {
    name = element(keys(var.secret_arns), count.index)
    arn  = element(values(var.secret_arns), count.index)
  }
}
