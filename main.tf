resource "aws_elasticsearch_domain" "das-meta" {
  domain_name           = var.domain
  elasticsearch_version = "7.10"

  cluster_config {
    instance_type = var.instance_type
  }
  snapshot_options {
    automated_snapshot_start_hour = 23
  }
  vpc_options {
    subnet_ids = ["subnet-0d8c53ffee6d4c59e"] #subnet-016e77be32f1570f2
  }
  ebs_options {
    ebs_enabled = var.ebs_volume_size > 0 ? true : false
    volume_size = var.ebs_volume_size
    volume_type = var.volume_type
  }
  # tags = {
  #   Domain = var.tag_domain
  # }
}
resource "aws_elasticsearch_domain_policy" "main" {
  domain_name     = aws_elasticsearch_domain.das-meta.domain_name
  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
    {
    "Action": "das-meta:*",
    "Principal": "*",
    "Effect": "Allow",
    "Resource": "${aws_elasticsearch_domain.das-meta.arn}/*"
    }
    ]
}
POLICIES
}