resource "aws_ecs_cluster" "main" {
  # name = "dev-cluster"
  name = var.cluster_name
}

data "template_file" "app" {
  template = file("../templates/ecs_app.json.tmpl")

  vars = merge({
    # app_image      = var.app_image
    # app_image      = data.aws_ecr_repository.repo.repository_url # aws_ecr_repository.ecs_app.repository_url
    app_image      = "${data.aws_ecr_repository.repo.repository_url}:${var.image_tag}" # aws_ecr_repository.ecs_app.repository_url
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
    name           = var.aws_ecr_repository
    app_name       = var.app_name
    stage          = var.stage
    # tag            = var.tag
    }, {
    env_config    = join(",", data.template_file.env.*.rendered)
    secret_config = join(",", data.template_file.secrets.*.rendered)
  })
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.app_name}-${var.stage}-task" # "cb-app-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.app.rendered
  # container_definitions = jsonencode([
  #   {
  #     name   = var.aws_ecr_repository
  #     image  = "600023384173.dkr.ecr.ap-south-1.amazonaws.com/demo_ecs_app:latest"
  #     cpu    = var.fargate_cpu
  #     memory = var.fargate_memory
  #     portMappings = [
  #       {
  #         containerPort = var.app_port
  #         hostPort      = var.app_port
  #       }
  #     ]
  #   }
  # ])
}

resource "aws_ecs_service" "main" {
  name            = "${var.app_name}-${var.stage}-service" # "cb-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = var.app_name # "cb-app"
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]
}
