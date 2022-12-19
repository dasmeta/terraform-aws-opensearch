module "elasticsearch-cloudwatch-sns-alarms" {
  source           = "dubiety/elasticsearch-cloudwatch-sns-alarms/aws"
  version          = "3.0.3"
  domain_name      = var.cluster_name
  sns_topic        = "dasmeta"
  sns_topic_prefix = "test"
}
