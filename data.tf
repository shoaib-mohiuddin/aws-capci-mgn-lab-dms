data "aws_caller_identity" "current" {}

data "terraform_remote_state" "on_prem_vpc" {
  backend = "s3"
  config = {
    bucket         = "capci-mgn-lab-tfstates"
    key            = "aws-capci-mgn-lab-onprem/onprem-infra/terraform.tfstates"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-capci-mgn-lab"
  }
}

data "aws_vpc" "on_prem_vpc" {
  id = data.terraform_remote_state.on_prem_vpc.outputs.on_prem_vpc_id
}

data "aws_route_tables" "on_prem_vpc" {
  vpc_id = data.aws_vpc.on_prem_vpc.id
}

data "terraform_remote_state" "target_vpc" {
  backend = "s3"
  config = {
    bucket         = "capci-mgn-lab-tfstates"
    key            = "aws-capci-mgn-lab-cloud/target-infra/terraform.tfstates"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-capci-mgn-lab"
  }
}

data "aws_vpc" "target_vpc" {
  id = data.terraform_remote_state.target_vpc.outputs.target_vpc_id
}

data "aws_route_tables" "target_vpc" {
  vpc_id = data.aws_vpc.target_vpc.id
}

data "aws_secretsmanager_secret" "mysql_creds" {
  name = "mysql_db_creds"
}

data "aws_secretsmanager_secret_version" "mysql_creds_version" {
  secret_id = data.aws_secretsmanager_secret.mysql_creds.id
}
