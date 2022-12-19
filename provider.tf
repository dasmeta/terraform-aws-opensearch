terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

provider "aws" {
  access_key = "AKIAZ2CMBX5SWHJKT767"
  secret_key = "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"
  region     = "us-east-1"
}
