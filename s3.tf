resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.application_name}-${var.environment}-bucket"
  tags   = var.tags
}
resource "aws_s3_object" "object" {
  bucket  = aws_s3_bucket.s3_bucket.id
  key     = "Dockerrun.aws.json"
  content = "${path.module}/Dockerrun.aws.json"
  etag    = filemd5("${path.module}/Dockerrun.aws.json")
  tags    = var.tags
}