output "s3_bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}
output "beanstalk_id" {
  value = aws_elastic_beanstalk_application.beanstalk_application.id
}
output "ecr_url_arn" {
  value = aws_ecr_repository.ecr.arn
}
output "aws_s3_object_id" {
  value = aws_s3_object.object.id
}
output "aws_iam_role_id" {
  value = aws_iam_role.beanstalk_role_service.id
}
output "aws_iam_role_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.beanstalk_log_attach.id
}
output "aws_iam_role_policy_attachment_arn" {
  value = aws_iam_role_policy_attachment.beanstalk_log_attach.policy_arn
}
output "aws_iam_instance_profile_arn" {
  value = aws_iam_instance_profile.beanstalk_iam_instance_profile.arn
}
output "aws_iam_instance_profile_id" {
  value = aws_iam_instance_profile.beanstalk_iam_instance_profile.id
}
output "aws_elastic_beanstalk_application_id" {
  value = aws_elastic_beanstalk_application.beanstalk_application.id
}
output "aws_elastic_beanstalk_environment_arn" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.arn
}
output "aws_elastic_beanstalk_environment_id" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.id
}
output "aws_elastic_beanstalk_environment_url" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.endpoint_url
}
output "aws_elastic_beanstalk_application_version_id" {
  value = aws_elastic_beanstalk_application_version.beanstalk_application_ebs_version.id
}

