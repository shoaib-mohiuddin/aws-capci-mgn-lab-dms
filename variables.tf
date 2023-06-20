variable "region" {
  description = "AWS region to work with"
  type        = string
}

variable "db_port" {
  description = "RDS database engine port"
  type        = number
  default     = 3306
}

variable "db_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "RDS database engine"
  type        = string
  default     = "mysql"
}

variable "repl_subnet_group_name" {
  description = "DMS subnet group name"
  type        = string
}

variable "repl_subnet_group_description" {
  description = "A description for the DMS subnet group"
  type        = string
  default     = "DMS Subnet group"
}

variable "repl_instance_class" {
  description = "Instance class/type for the DMS replication instance"
  type        = string
}

variable "repl_instance_identifier" {
  description = "DMS replication instance identifier"
  type        = string
}
