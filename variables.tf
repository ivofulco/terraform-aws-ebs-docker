variable "region" {
  description = "Region more useful of your account"
  type        = string
  default     = "sa-east-1"
}
variable "tags" {
  description = "Common tags across all resources."
  type        = map(string)
}
variable "environment" {
  description = "Environment type, poc, dev, sandbox, hml, prod. Default is dev"
  type        = string
  default     = "dev"
}
variable "ecr_name" {
  description = "Elastic container registry name"
  type        = string
}
variable "beanstalk_application_version_name" {
  description = "Elastic Beanstalk application version name."
  type        = string
}
variable "beanstalk_application_version_description" {
  description = "Elastic Beanstalk application version description"
  type        = string
}
variable "application_name" {
  description = "Name of application/project"
  type        = string
}
variable "solution_stack_name" {
  description = "Stack usage of your beanstalk"
  type        = string
}
variable "beanstalk_application_description" {
  description = "Description of application on beanstalk"
  type        = string
}
variable "beanstalk_instance_profile_name" {
  description = "Name profile of application on beanstalk"
  type        = string
}
variable "beanstalk_role_name" {
  description = "Role of application on beanstalk"
  type        = string
}
variable "secret_key" {
  description = "Service user secret key of your provider"
  type        = string
  sensitive   = true
}
variable "access_key" {
  description = "Service user access key of your provider"
  type        = string
}
variable "aws_account_id" {
  description = "Identifier of your aws account"
  type        = string
}