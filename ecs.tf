resource "aws_ecs_cluster" "main" {
  name = var.project_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

module "ecs_fargate" {
  source = "./modules/fargate-module"
  count  = var.cluster_fargate_only ? 1 : 0

  aws_ecs_cluster_name       = aws_ecs_cluster.main.name
  project_name               = var.project_name
  fargate_capacity_providers = var.fargate_capacity_providers
}

module "ecs_ec2" {
  source = "./modules/ec2-module"
  count  = var.cluster_fargate_only ? 0 : 1

  aws_ecs_cluster_name           = aws_ecs_cluster.main.name
  project_name                   = var.project_name
  nodes_ami                      = var.nodes_ami
  nodes_instance_type            = var.nodes_instance_type
  nodes_volume_size              = var.nodes_volume_size
  nodes_volume_type              = var.nodes_volume_type
  cluster_on_demand_min_size     = var.cluster_on_demand_min_size
  cluster_on_demand_max_size     = var.cluster_on_demand_max_size
  cluster_on_demand_desired_size = var.cluster_on_demand_desired_size
  cluster_spot_min_size          = var.cluster_spot_min_size
  cluster_spot_max_size          = var.cluster_spot_max_size
  cluster_spot_desired_size      = var.cluster_spot_desired_size

  vpc_id            = data.aws_ssm_parameter.vpc.value
  subnet_private_1a = data.aws_ssm_parameter.subnet_private_1a.value
  subnet_private_1b = data.aws_ssm_parameter.subnet_private_1b.value
  subnet_private_1c = data.aws_ssm_parameter.subnet_private_1c.value
}