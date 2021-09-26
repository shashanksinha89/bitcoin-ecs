resource "aws_ecs_task_definition" "task" {
  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = var.iam_role
  #container_definitions = << DEFINITION
  container_definitions = jsonencode([
    {
      name      = "container"
      image     = "457360123202.dkr.ecr.us-east-1.amazonaws.com/bitcoin"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 8332
          hostPort      = 8332
        },
        {
          containerPort = 8333
          hostPort      = 8333
        },
        {
          containerPort = 18332
          hostPort      = 18332
        },
        {
          containerPort = 18333
          hostPort      = 18333
        },
        {
          containerPort = 18444
          hostPort      = 18444
        }
      ]
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "bitcoin",
          "awslogs-region" : "us-east-1",
          "awslogs-stream-prefix" : "ecs"
        }
      }
    }
  ])
}
