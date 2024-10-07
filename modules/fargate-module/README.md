<!-- BEGIN_TF_DOCS -->
# linuxtips-containers-ecs-cluster

## FARGATE-MODULE

> Submódulo responsável por criar os recursos relacionados ao Fargate para o cluster ECS.

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
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecs_cluster_name"></a> [aws\_ecs\_cluster\_name](#input\_aws\_ecs\_cluster\_name) | O nome do cluster ECS. | `string` | n/a | yes |
| <a name="input_fargate_capacity_providers"></a> [fargate\_capacity\_providers](#input\_fargate\_capacity\_providers) | A lista dos capacity providers que serão permitidos no cluster Fargate. | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto. | `string` | n/a | yes |

## Outputs

No outputs.

## Terraform-Docs

Documentação gerada automaticamente com [terraform-docs](/.terraform-docs.yml)

```sh
# gerar documentacao do terraform com base nas configuracoes do arquivo '.terraform-docs.yml'
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```
<!-- END_TF_DOCS -->