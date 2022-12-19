module "opensearch" {
  source = "./aws-opensearch"

  cluster_name    = var.cluster_name
  aws_region      = var.aws_region
  cluster_version = "OpenSearch_2.3"
}
