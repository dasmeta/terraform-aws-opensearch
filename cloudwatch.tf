resource "aws_cloudwatch_dashboard" "dash" {
  dashboard_name = var.dashboard_name    
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ES", "FreeStorageSpace", "DomainName", "${aws_elasticsearch_domain.es.domain_name}"]
        ],
        "period": 300,
        "stat": "Average",
        "title": "Free Storage Space"
      }
    }
  ]
}
EOF
}