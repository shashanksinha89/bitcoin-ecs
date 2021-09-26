resource "aws_ecs_service" "bitcoin" {
  depends_on = [
    aws_ecs_task_definition.task,
    aws_ecs_cluster.cluster,
    aws_cloudwatch_log_group.log_group,
  ]
  name            = var.service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.service_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [for s in data.aws_subnet.example : s.id]
    assign_public_ip = true
  }
}