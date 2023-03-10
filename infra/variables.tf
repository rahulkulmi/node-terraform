variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}

variable "aws_vpc_name" {
  type        = string
  description = "Add name for your VPC."
  default     = "newput-dev"
}

variable "stage" {
  default = "dev"
}

variable "cluster_name" {
  type        = string
  description = "The cluster to add the ECS service to"
  default     = "newput-dev"
}

# variable "ecs_task_execution_role_name" {
#   description = "ECS task execution role name"
#   default = "myEcsTaskExecutionRole"
# }

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "newput/node-terraform:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "app_name" {
  type        = string
  description = "The application name"
  default     = "node-terraform"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repo name"
  default     = "newput/node-terraform"
}

variable "image_name" {
  description = " "
  default     = "newput/node-terraform"
}

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of environment vars to make is easier to pass"
}

variable "secret_arns" {
  type        = map(string)
  default     = {}
  description = "Map of secrets to use in the template"
}
