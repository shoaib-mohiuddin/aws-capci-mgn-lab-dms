module "dms" {
  source  = "terraform-aws-modules/dms/aws"
  version = "1.6.1"

  # Subnet group
  repl_subnet_group_name        = var.repl_subnet_group_name
  repl_subnet_group_description = var.repl_subnet_group_description
  repl_subnet_group_subnet_ids  = data.terraform_remote_state.target_vpc.outputs.staging_area_subnet_ids

  # Replication Instance
  repl_instance_allocated_storage      = var.db_storage
  repl_instance_engine_version         = "3.4.7"
  repl_instance_multi_az               = false
  repl_instance_publicly_accessible    = false
  repl_instance_class                  = var.repl_instance_class
  repl_instance_id                     = var.repl_instance_identifier
  repl_instance_vpc_security_group_ids = [data.terraform_remote_state.target_vpc.outputs.rds_sg_id]
  repl_instance_tags = {
    Name = var.repl_instance_identifier
  }
  # tags = var.tags

  # Endpoints
  endpoints = {
    source = {
      endpoint_id   = "onprem-mysql"
      endpoint_type = "source"
      engine_name   = var.db_engine
      username      = local.db_uname
      password      = local.db_passwd
      port          = var.db_port
      server_name   = data.terraform_remote_state.on_prem_vpc.outputs.onprem_db_private_ip # private ip on-prem db server
      ssl_mode      = "none"
    }

    destination = {
      endpoint_id   = "rds-mysql"
      endpoint_type = "target"
      engine_name   = var.db_engine
      username      = local.db_uname
      password      = local.db_passwd
      port          = var.db_port
      server_name   = data.terraform_remote_state.target_vpc.outputs.db_instance_address
      ssl_mode      = "none"
    }
  }

  # Database migration task
  replication_tasks = {
    cdc_ex = {
      replication_task_id = "onprem2aws"
      migration_type      = "full-load"
      source_endpoint_key = "source"
      target_endpoint_key = "destination"
      table_mappings      = file("files/table_mappings.json")
    }
  }
}
