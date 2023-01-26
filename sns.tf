
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

