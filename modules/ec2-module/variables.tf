variable "project_name" {
  type        = string
  description = "Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto."
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "O nome do cluster ECS."
}

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

variable "vpc_id" {
  description = "O ID da VPC."
  type        = string
}

variable "subnet_private_1a" {
  type        = string
  description = "ID da subnet privada na zona de disponibilidade 1a."
}

variable "subnet_private_1b" {
  type        = string
  description = "ID da subnet privada na zona de disponibilidade 1b."
}

variable "subnet_private_1c" {
  type        = string
  description = "ID da subnet privada na zona de disponibilidade 1c."
}