resource "aws_autoscaling_group" "spots" {
  name_prefix = format("%s-spots", var.project_name)

  vpc_zone_identifier = [
    var.subnet_private_1a,
    var.subnet_private_1b,
    var.subnet_private_1c,
  ]

  desired_capacity                 = var.cluster_spot_desired_size
  max_size                         = var.cluster_spot_max_size
  min_size                         = var.cluster_spot_min_size
  ignore_failed_scaling_activities = true
  wait_for_capacity_timeout        = "5m"

  launch_template {
    id      = aws_launch_template.spots.id
    version = aws_launch_template.spots.latest_version
  }

  tag {
    key                 = "Name"
    value               = format("%s-spots", var.project_name)
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}

resource "aws_ecs_capacity_provider" "spots" {
  name = format("%s-spots", var.project_name)

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.spots.arn
    managed_scaling {
      maximum_scaling_step_size = 10
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 90
    }
  }
}