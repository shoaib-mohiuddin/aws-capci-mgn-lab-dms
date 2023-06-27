# aws-capci-mgn-lab-dms

#### Table of Contents
1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Providers](#Providers)
4. [Inputs](#inputs)
5. [Outputs](#outputs)
## Overview
#### AWS Application Migration Service(MGN)
![mgn](images/mgn.png "AWS MGN")

#### AWS Database Migration Service(DMS)
![dms](images/dms.png "AWS DMS")

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dms"></a> [dms](#module\_dms) | terraform-aws-modules/dms/aws | 1.6.1 |

## Resources

| Name | Type |
|------|------|
| [aws_route.acceptor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.requestor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route_tables.on_prem_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_route_tables.target_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_secretsmanager_secret.mysql_creds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.mysql_creds_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_vpc.on_prem_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.target_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.on_prem_vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.target_vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | RDS database engine | `string` | `"mysql"` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | RDS database engine port | `number` | `3306` | no |
| <a name="input_db_storage"></a> [db\_storage](#input\_db\_storage) | Allocated storage in GB | `number` | `20` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to work with | `string` | n/a | yes |
| <a name="input_repl_instance_class"></a> [repl\_instance\_class](#input\_repl\_instance\_class) | Instance class/type for the DMS replication instance | `string` | n/a | yes |
| <a name="input_repl_instance_identifier"></a> [repl\_instance\_identifier](#input\_repl\_instance\_identifier) | DMS replication instance identifier | `string` | n/a | yes |
| <a name="input_repl_subnet_group_description"></a> [repl\_subnet\_group\_description](#input\_repl\_subnet\_group\_description) | A description for the DMS subnet group | `string` | `"DMS Subnet group"` | no |
| <a name="input_repl_subnet_group_name"></a> [repl\_subnet\_group\_name](#input\_repl\_subnet\_group\_name) | DMS subnet group name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->