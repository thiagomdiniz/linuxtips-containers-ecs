<!-- BEGIN_TF_DOCS -->
# linuxtips-containers-ecs-cluster

## EC2-MODULE

> Submódulo responsável por criar os recursos relacionados ao EC2 para o cluster ECS.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.on_demand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_group.spots](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_ecs_capacity_provider.on_demand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_capacity_provider.spots](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ec2_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.on_demand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_launch_template.spots](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.subnet_ranges](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecs_cluster_name"></a> [aws\_ecs\_cluster\_name](#input\_aws\_ecs\_cluster\_name) | O nome do cluster ECS. | `string` | n/a | yes |
| <a name="input_cluster_on_demand_desired_size"></a> [cluster\_on\_demand\_desired\_size](#input\_cluster\_on\_demand\_desired\_size) | O número desejado de instâncias on-demand no cluster ECS. | `number` | n/a | yes |
| <a name="input_cluster_on_demand_max_size"></a> [cluster\_on\_demand\_max\_size](#input\_cluster\_on\_demand\_max\_size) | O tamanho máximo do cluster ECS para instâncias on-demand. | `number` | n/a | yes |
| <a name="input_cluster_on_demand_min_size"></a> [cluster\_on\_demand\_min\_size](#input\_cluster\_on\_demand\_min\_size) | O tamanho mínimo do cluster ECS para instâncias on-demand. | `number` | n/a | yes |
| <a name="input_cluster_spot_desired_size"></a> [cluster\_spot\_desired\_size](#input\_cluster\_spot\_desired\_size) | O número desejado de instâncias spot no cluster ECS. | `number` | n/a | yes |
| <a name="input_cluster_spot_max_size"></a> [cluster\_spot\_max\_size](#input\_cluster\_spot\_max\_size) | O tamanho máximo do cluster ECS para instâncias spot. | `number` | n/a | yes |
| <a name="input_cluster_spot_min_size"></a> [cluster\_spot\_min\_size](#input\_cluster\_spot\_min\_size) | O tamanho mínimo do cluster ECS para instâncias spot. | `number` | n/a | yes |
| <a name="input_nodes_ami"></a> [nodes\_ami](#input\_nodes\_ami) | A AMI a ser usada pelos nodes do cluster ECS. | `string` | n/a | yes |
| <a name="input_nodes_instance_type"></a> [nodes\_instance\_type](#input\_nodes\_instance\_type) | O tipo de instância EC2 a ser usado pelos nodes do ECS. | `string` | n/a | yes |
| <a name="input_nodes_volume_size"></a> [nodes\_volume\_size](#input\_nodes\_volume\_size) | O tamanho do volume, em GiB, a ser usado pelos nodes do ECS. | `number` | n/a | yes |
| <a name="input_nodes_volume_type"></a> [nodes\_volume\_type](#input\_nodes\_volume\_type) | O tipo de volume EBS a ser usado pelos nodes do ECS (ex: 'gp2', 'io1'). | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto. | `string` | n/a | yes |
| <a name="input_subnet_private_1a"></a> [subnet\_private\_1a](#input\_subnet\_private\_1a) | ID da subnet privada na zona de disponibilidade 1a. | `string` | n/a | yes |
| <a name="input_subnet_private_1b"></a> [subnet\_private\_1b](#input\_subnet\_private\_1b) | ID da subnet privada na zona de disponibilidade 1b. | `string` | n/a | yes |
| <a name="input_subnet_private_1c"></a> [subnet\_private\_1c](#input\_subnet\_private\_1c) | ID da subnet privada na zona de disponibilidade 1c. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | O ID da VPC. | `string` | n/a | yes |

## Outputs

No outputs.

## Terraform-Docs

Documentação gerada automaticamente com [terraform-docs](/.terraform-docs.yml)

```sh
# gerar documentacao do terraform com base nas configuracoes do arquivo '.terraform-docs.yml'
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```
<!-- END_TF_DOCS -->