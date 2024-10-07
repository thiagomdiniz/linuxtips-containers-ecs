variable "project_name" {
  type        = string
  description = "Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto."
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "O nome do cluster ECS."
}

variable "fargate_capacity_providers" {
  type        = list(string)
  description = "A lista dos capacity providers que serão permitidos no cluster Fargate."
}