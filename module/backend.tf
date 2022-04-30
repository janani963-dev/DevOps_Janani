terraform {
  backend "s3" {
    bucket         = "apr-s3-bucket"
    key            = ".terraform/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terradynamo"

  }
}