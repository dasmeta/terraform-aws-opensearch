variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "opensearch"
}

variable "aws_region" {
  description = "The hosted zone name of the OpenSearch cluster."
  type        = string
  default     = "us-east-1"
}
