# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/ecs/${var.app_name}-${var.stage}" #"/ecs/cb-app"
  retention_in_days = 7

  tags = {
    Name = "${var.app_name}-${var.stage}-log-group" # "cb-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "${var.app_name}-${var.stage}-log-stream" # "cb-log-stream"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}
