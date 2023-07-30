terraform {
  backend "s3" {
    bucket = "example-terraform-state"
    key    = "dev/example.tfstate"
    region = "sa-east-1"
  }
}