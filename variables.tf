variable "aws_access_key" {
  default = "AKIAYHLZZFMQIK3SSVII"
}

variable "aws_secret_key" {
  default = "SZIoJzdxPPoRhds1GJPxbBnNIsJ7y3SiE2jSzGD9"
}
output "arn" {
  value = aws_elasticsearch_domain.das-meta.arn
}
output "domain_id" {
  value = aws_elasticsearch_domain.das-meta.domain_id
}
output "domain_name" {
  value = aws_elasticsearch_domain.das-meta.domain_name
}
output "endpoint" {
  value = aws_elasticsearch_domain.das-meta.endpoint
}
output "kibana_endpoint" {
  value = aws_elasticsearch_domain.das-meta.kibana_endpoint
}