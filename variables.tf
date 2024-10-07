# General Configs

variable "project_name" {
  type        = string
  description = "Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto."
}

variable "aws_region" {
  type        = string
  description = "Região da AWS onde os recursos serão criados."
}

# SSM VPC

variable "ssm_vpc_id" {
  description = "O ID da VPC onde os recursos relacionados ao SSM serão criados."
  type        = string
}

variable "ssm_public_subnet_1" {
  description = "O ID da primeira subnet pública na VPC para recursos SSM."
  type        = string
}

variable "ssm_public_subnet_2" {
  description = "O ID da segunda subnet pública na VPC para recursos SSM."
  type        = string
}

variable "ssm_public_subnet_3" {
  description = "O ID da terceira subnet pública na VPC para recursos SSM."
  type        = string
}

variable "ssm_private_subnet_1" {
  description = "O ID da primeira subnet privada na VPC para recursos SSM."
  type        = string
}

variable "ssm_private_subnet_2" {
  description = "O ID da segunda subnet privada na VPC para recursos SSM."
  type        = string
}

variable "ssm_private_subnet_3" {
  description = "O ID da terceira subnet privada na VPC para recursos SSM."
  type        = string
}

# Balancer

variable "load_balancer_internal" {
  description = "Define se o Load Balancer deve ser interno (true) ou externo (false)."
  type        = bool
}

variable "load_balancer_type" {
  description = "O tipo de Load Balancer a ser criado (ex: 'application' ou 'network')."
  type        = string
}

# ECS General

variable "nodes_ami" {
  description = "A AMI a ser usada pelos nodes do cluster ECS."
  type        = string
}

variable "nodes_instance_type" {
  description = "O tipo de instância EC2 a ser usado pelos nodes do ECS."
  type        = string
}

variable "nodes_volume_size" {
  description = "O tamanho do volume, em GiB, a ser usado pelos nodes do ECS."
  type        = number
}

variable "nodes_volume_type" {
  description = "O tipo de volume EBS a ser usado pelos nodes do ECS (ex: 'gp2', 'io1')."
  type        = string
}

variable "cluster_on_demand_min_size" {
  description = "O tamanho mínimo do cluster ECS para instâncias on-demand."
  type        = number
}

variable "cluster_on_demand_max_size" {
  description = "O tamanho máximo do cluster ECS para instâncias on-demand."
  type        = number
}

variable "cluster_on_demand_desired_size" {
  description = "O número desejado de instâncias on-demand no cluster ECS."
  type        = number
}

variable "cluster_spot_min_size" {
  description = "O tamanho mínimo do cluster ECS para instâncias spot."
  type        = number
}

variable "cluster_spot_max_size" {
  description = "O tamanho máximo do cluster ECS para instâncias spot."
  type        = number
}

variable "cluster_spot_desired_size" {
  description = "O número desejado de instâncias spot no cluster ECS."
  type        = number
}

variable "cluster_fargate_only" {
  description = "Defina o valor como false caso queira usar recursos EC2 para rodar as tasks, e não apenas Fargate."
  type        = bool
  default     = true
}

variable "fargate_capacity_providers" {
  type        = list(string)
  description = "A lista dos capacity providers que serão permitidos no cluster Fargate."
  default = [
    "FARGATE", "FARGATE_SPOT"
  ]
}