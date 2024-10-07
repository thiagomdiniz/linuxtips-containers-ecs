resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = var.aws_ecs_cluster_name
  capacity_providers = var.fargate_capacity_providers

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 100
    base              = 1
  }

}