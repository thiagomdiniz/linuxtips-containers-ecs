resource "aws_ssm_parameter" "lb_arn" {
  name  = "/linuxtips/ecs/lb/id"
  type  = "String"
  value = aws_lb.main.arn
}

resource "aws_ssm_parameter" "lb_listener" {
  name  = "/linuxtips/ecs/lb/listener"
  type  = "String"
  value = aws_lb_listener.main.arn
}

resource "aws_ssm_parameter" "lb_internal_arn" {
  name  = "/linuxtips/ecs/lb/internal/id"
  type  = "String"
  value = aws_lb.internal.arn
}

resource "aws_ssm_parameter" "lb_internal_listener" {
  name  = "/linuxtips/ecs/lb/internal/listener"
  type  = "String"
  value = aws_lb_listener.internal.arn
}

resource "aws_ssm_parameter" "cloudmap" {
  name  = "/linuxtips/ecs/cloudmap/namespace"
  type  = "String"
  value = aws_service_discovery_private_dns_namespace.main.id
}

resource "aws_ssm_parameter" "service_connect" {
  name  = "/linuxtips/ecs/service-connect/namespace"
  type  = "String"
  value = aws_service_discovery_private_dns_namespace.sc.id
}

resource "aws_ssm_parameter" "service_connect_name" {
  name  = "/linuxtips/ecs/service-connect/name"
  type  = "String"
  value = aws_service_discovery_private_dns_namespace.sc.name
}

resource "aws_ssm_parameter" "vpc_link" {
  name  = "/linuxtips/ecs/vpc-link/id"
  type  = "String"
  value = aws_api_gateway_vpc_link.main.id
}