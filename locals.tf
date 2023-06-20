locals {
  db_uname  = jsondecode(data.aws_secretsmanager_secret_version.mysql_creds_version.secret_string)["mysql_db_uname"]
  db_passwd = jsondecode(data.aws_secretsmanager_secret_version.mysql_creds_version.secret_string)["mysql_db_passwd"]
}
