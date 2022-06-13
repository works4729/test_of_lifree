#############################################################
# SSMパラメータストア
#############################################################

#============================================================
# Common
#============================================================
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

resource "aws_ssm_parameter" "access-key-id" {
  name = "access-key-id"
  value = var.AWS_ACCESS_KEY_ID
  type = "SecureString"
  description = "AWS_ACCESS_KEY_ID"
}
resource "aws_ssm_parameter" "secret-access-key" {
  name = "secret-access-key"
  value = var.AWS_SECRET_ACCESS_KEY
  type = "SecureString"
  description = "AWS_SECRET_ACCESS_KEY"
}

#============================================================
# API
#============================================================
variable "API_PORT" {}
variable "DB_HOST" {}
variable "DB_NAME" {}
variable "DB_USERNAME" {}
variable "DB_PASSWORD" {}
variable "RAILS_MASTER_KEY" {}

resource "aws_ssm_parameter" "api-port" {
  name = "api-port"
  value = var.API_PORT
  type = "SecureString"
  description = "API_PORT"
}
resource "aws_ssm_parameter" "db-host" {
  name = "db-host"
  value = var.DB_HOST
  type = "SecureString"
  description = "DB_HOST"
}
resource "aws_ssm_parameter" "db-name" {
  name = "db-name"
  value = var.DB_NAME
  type = "SecureString"
  description = "DB_NAME"
}
resource "aws_ssm_parameter" "db-username" {
  name = "db-username"
  value = var.DB_USERNAME
  type = "SecureString"
  description = "DB_USERNAME"
}
resource "aws_ssm_parameter" "db-password" {
  name = "db-password"
  value = var.DB_PASSWORD
  type = "SecureString"
  description = "DB_PASSWORD"
}
resource "aws_ssm_parameter" "rails-master-key" {
  name = "rails-master-key"
  value = var.RAILS_MASTER_KEY
  type = "SecureString"
  description = "RAILS_MASTER_KEY"
}