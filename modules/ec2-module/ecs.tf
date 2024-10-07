resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = var.aws_ecs_cluster_name
  capacity_providers = [
    aws_ecs_capacity_provider.on_demand.name,
    aws_ecs_capacity_provider.spots.name,
  ]

  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.on_demand.name
    weight            = 100
    base              = 0
  }

}