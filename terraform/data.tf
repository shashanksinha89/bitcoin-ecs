provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Name = "project-bitcoin"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "tf-state-ref010"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_subnet_ids" "example" {
  vpc_id = var.vpc_id
}

data "aws_subnet" "example" {
  for_each = data.aws_subnet_ids.example.ids
  id       = each.value
}
