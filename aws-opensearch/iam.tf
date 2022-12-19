# resource "aws_iam_role" "es" {
#   name               = "es_role"
#   assume_role_policy = data.aws_iam_policy_document.es_policy_assume.json
# }


data "aws_iam_policy_document" "es_policy_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }
  }
}

# data "aws_iam_policy_document" "es_policy" {
#   depends_on = [aws_elasticsearch_domain.opensearch]
#   statement {
#     actions   = ["es:*"]
#     resources = ["${aws_elasticsearch_domain.opensearch.arn}/*"]
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }
#   }
# }

# resource "aws_iam_policy" "es_policy" {
#   name   = "es_policy"
#   policy = data.aws_iam_policy_document.es_policy.json
# }

# resource "aws_iam_role_policy_attachment" "actions_es_policy_attach" {
#   policy_arn = aws_iam_policy.es_policy.arn
#   role       = aws_iam_role.es.name
# }

#====================================================

# data "aws_iam_policy_document" "es_to_sns_policy" {
#   statement {
#     actions   = ["sns:Publish"]
#     resources = [module.elasticsearch-cloudwatch-sns-alarms.sns_topic_arn]
#   }
# }

# resource "aws_iam_policy" "es_to_sns_policy" {
#   name   = "es_to_sns_policy"
#   policy = data.aws_iam_policy_document.es_to_sns_policy.json
# }

# resource "aws_iam_role_policy_attachment" "actions_es_sns_attach" {
#   policy_arn = aws_iam_policy.es_to_sns_policy.arn
#   role       = aws_iam_role.es.name
# }


resource "aws_elasticsearch_domain_policy" "main" {
  domain_name     = aws_elasticsearch_domain.opensearch.domain_name
  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {
                "IpAddress": {"aws:SourceIp": "127.0.0.1/32"}
            },
            "Resource": "${aws_elasticsearch_domain.opensearch.arn}/*"
        }
    ]
}
POLICIES
}

# resource "aws_elasticsearch_domain_policy" "es_to_sns_policy" {
#   domain_name     = aws_elasticsearch_domain.opensearch.domain_name
#   access_policies = <<CONFIG
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Action": "sns:Publish",
#             "Effect": "Allow",
#             "Resource": "${module.elasticsearch-cloudwatch-sns-alarms.sns_topic_arn}"
#         }
#     ]
# }
# CONFIG
# }
