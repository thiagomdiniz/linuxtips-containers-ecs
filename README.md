<!-- BEGIN_TF_DOCS -->
# linuxtips-containers-ecs-cluster

> Repositório desenvolvido na aula sobre criação do cluster ECS.

## Arquitetura Inicial

![Arquitetura](/docs/ecs-cluster.drawio.png)

## Terraform

Defina as variáveis do `terraform` com base [nestes arquivos de exemplo](/environment/dev/).  
Exemplo de utilização do `terraform` referenciando os arquivos `.tfvars`:

```sh
# inicializar terraform
terraform init -backend-config=environment/dev/backend.tfvars

# exibir o plano de execucao, o que sera alterado
terraform plan -var-file=environment/dev/terraform.tfvars
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.66.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_ec2"></a> [ecs\_ec2](#module\_ecs\_ec2) | ./modules/ec2-module | n/a |
| <a name="module_ecs_fargate"></a> [ecs\_fargate](#module\_ecs\_fargate) | ./modules/fargate-module | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_security_group.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.lb_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.subnet_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.subnet_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.subnet_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Região da AWS onde os recursos serão criados. | `string` | n/a | yes |
| <a name="input_cluster_fargate_only"></a> [cluster\_fargate\_only](#input\_cluster\_fargate\_only) | Defina o valor como false caso queira usar recursos EC2 para rodar as tasks, e não apenas Fargate. | `bool` | `true` | no |
| <a name="input_cluster_on_demand_desired_size"></a> [cluster\_on\_demand\_desired\_size](#input\_cluster\_on\_demand\_desired\_size) | O número desejado de instâncias on-demand no cluster ECS. | `number` | n/a | yes |
| <a name="input_cluster_on_demand_max_size"></a> [cluster\_on\_demand\_max\_size](#input\_cluster\_on\_demand\_max\_size) | O tamanho máximo do cluster ECS para instâncias on-demand. | `number` | n/a | yes |
| <a name="input_cluster_on_demand_min_size"></a> [cluster\_on\_demand\_min\_size](#input\_cluster\_on\_demand\_min\_size) | O tamanho mínimo do cluster ECS para instâncias on-demand. | `number` | n/a | yes |
| <a name="input_cluster_spot_desired_size"></a> [cluster\_spot\_desired\_size](#input\_cluster\_spot\_desired\_size) | O número desejado de instâncias spot no cluster ECS. | `number` | n/a | yes |
| <a name="input_cluster_spot_max_size"></a> [cluster\_spot\_max\_size](#input\_cluster\_spot\_max\_size) | O tamanho máximo do cluster ECS para instâncias spot. | `number` | n/a | yes |
| <a name="input_cluster_spot_min_size"></a> [cluster\_spot\_min\_size](#input\_cluster\_spot\_min\_size) | O tamanho mínimo do cluster ECS para instâncias spot. | `number` | n/a | yes |
| <a name="input_fargate_capacity_providers"></a> [fargate\_capacity\_providers](#input\_fargate\_capacity\_providers) | A lista dos capacity providers que serão permitidos no cluster Fargate. | `list(string)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | Define se o Load Balancer deve ser interno (true) ou externo (false). | `bool` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | O tipo de Load Balancer a ser criado (ex: 'application' ou 'network'). | `string` | n/a | yes |
| <a name="input_nodes_ami"></a> [nodes\_ami](#input\_nodes\_ami) | A AMI a ser usada pelos nodes do cluster ECS. | `string` | n/a | yes |
| <a name="input_nodes_instance_type"></a> [nodes\_instance\_type](#input\_nodes\_instance\_type) | O tipo de instância EC2 a ser usado pelos nodes do ECS. | `string` | n/a | yes |
| <a name="input_nodes_volume_size"></a> [nodes\_volume\_size](#input\_nodes\_volume\_size) | O tamanho do volume, em GiB, a ser usado pelos nodes do ECS. | `number` | n/a | yes |
| <a name="input_nodes_volume_type"></a> [nodes\_volume\_type](#input\_nodes\_volume\_type) | O tipo de volume EBS a ser usado pelos nodes do ECS (ex: 'gp2', 'io1'). | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_1"></a> [ssm\_private\_subnet\_1](#input\_ssm\_private\_subnet\_1) | O ID da primeira subnet privada na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_2"></a> [ssm\_private\_subnet\_2](#input\_ssm\_private\_subnet\_2) | O ID da segunda subnet privada na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_3"></a> [ssm\_private\_subnet\_3](#input\_ssm\_private\_subnet\_3) | O ID da terceira subnet privada na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_1"></a> [ssm\_public\_subnet\_1](#input\_ssm\_public\_subnet\_1) | O ID da primeira subnet pública na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_2"></a> [ssm\_public\_subnet\_2](#input\_ssm\_public\_subnet\_2) | O ID da segunda subnet pública na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_3"></a> [ssm\_public\_subnet\_3](#input\_ssm\_public\_subnet\_3) | O ID da terceira subnet pública na VPC para recursos SSM. | `string` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | O ID da VPC onde os recursos relacionados ao SSM serão criados. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_ssm_arn"></a> [lb\_ssm\_arn](#output\_lb\_ssm\_arn) | O Amazon Resource Name (ARN) do parâmetro do AWS Systems Manager (SSM) que armazena o ARN do Load Balancer. Esse valor pode ser usado para referenciar o ARN do Load Balancer em políticas de IAM, regras de segurança, ou em qualquer outro lugar que requeira o ARN do Load Balancer. |
| <a name="output_lb_ssm_listener"></a> [lb\_ssm\_listener](#output\_lb\_ssm\_listener) | O ID do parâmetro do AWS Systems Manager (SSM) que armazena o Listener do Load Balancer. Esse valor pode ser utilizado para referenciar o Listener em automações, scripts, ou dentro de outras configurações da AWS que necessitem do ID do Listener. |
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | O nome DNS do Load Balancer criado. Esse valor pode ser usado para acessar o Load Balancer dentro da rede ou pela internet, dependendo da configuração. |

## Terraform-Docs

Documentação gerada automaticamente com [terraform-docs](/.terraform-docs.yml)

```sh
# gerar documentacao do terraform com base nas configuracoes do arquivo '.terraform-docs.yml'
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```
<!-- END_TF_DOCS -->