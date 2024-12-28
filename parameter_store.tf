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