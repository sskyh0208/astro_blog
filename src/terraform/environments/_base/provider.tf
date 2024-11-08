terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.69.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Product = var.product_name
      Env     = local.env_name
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
  default_tags {
    tags = {
      Product = var.product_name
      Env     = local.env_name
    }
  }
}