resource "aws_vpc" "vpc_for_es" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc_for_es"
  }

}

resource "aws_subnet" "subnet_for_es" {
  vpc_id            = aws_vpc.vpc_for_es.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name : "${var.env_prefix}-subnet_for_es"
  }
}


resource "aws_cloudwatch_metric_alarm" "unavailable" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  period              = var.alarm_unavailable_period
  treat_missing_data  = var.treat_missing_data
}



resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.domain
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type = var.instance_type
  }
  snapshot_options {
    automated_snapshot_start_hour = 23
  }
  vpc_options {
    vpc_id     = aws_vpc.vpc_for_es.id
    subnet_ids = [aws_subnet.subnet_for_es.id]
  }
  ebs_options {
    ebs_enabled = var.ebs_volume_size > 0 ? true : false
    volume_size = var.ebs_volume_size
    volume_type = var.volume_type
  }
  tags = {
    Domain = var.tag_domain
  }
}
resource "aws_elasticsearch_domain_policy" "main" {
  domain_name     = aws_elasticsearch_domain.es.domain_name
  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
    {
    "Action": "es:*",
    "Principal": "*",
    "Effect": "Allow",
    "Resource": "${aws_elasticsearch_domain.es.arn}/*"
    }
    ]
}
POLICIES
}


resource "aws_sns_topic" "sns_topic" {
  name = var.sns_name

}


resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.sns_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json

}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
  }
}

