resource "aws_iam_role" "beanstalk_role_service" {
  name               = var.beanstalk_role_name
  tags               = var.tags
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "beanstalk_log_attach" {
  role       = aws_iam_role.beanstalk_role_service.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_instance_profile" "beanstalk_iam_instance_profile" {
  name = var.beanstalk_instance_profile_name
  role = aws_iam_role.beanstalk_role_service.name
  tags = var.tags
}
resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name        = "${var.application_name}-${var.environment}"
  description = var.beanstalk_application_description
  tags        = var.tags
}
resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                = "${var.application_name}-${var.environment}-env"
  application         = aws_elastic_beanstalk_application.beanstalk_application.name
  cname_prefix        = "${var.application_name}-${var.environment}"
  tags                = var.tags
  solution_stack_name = var.solution_stack_name
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_iam_instance_profile.arn
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "True"
  }
  dynamic "setting" {
    for_each = local.app_env
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}
resource "aws_elastic_beanstalk_application_version" "beanstalk_application_ebs_version" {
  name        = var.beanstalk_application_version_name
  application = aws_elastic_beanstalk_application.beanstalk_application.name
  description = var.beanstalk_application_version_description
  bucket      = aws_s3_bucket.s3_bucket.id
  key         = aws_s3_object.object.id
  tags        = var.tags
  depends_on  = [aws_s3_object.object]
}
