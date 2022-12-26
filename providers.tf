
provider "aws" {
  region     = "us-east-1"
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

# provider "vault" {
#   auth_login {
#     path = "auth/aws/login"
#     method = "aws"
#     parameters = {
#       role = "dev-role-iam"
#     }
#   }
# }