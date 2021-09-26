resource "aws_cloudwatch_log_group" "crypto" {
  name = "bitcoin-0.21.0"
}

resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = var.kms_key
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.crypto.name
      }
    }
  }
}
