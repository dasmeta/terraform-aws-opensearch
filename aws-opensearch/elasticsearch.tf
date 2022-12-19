resource "aws_elasticsearch_domain" "opensearch" {
  domain_name           = var.cluster_name
  elasticsearch_version = var.cluster_version

  cluster_config {
    dedicated_master_enabled = var.master_instance_enabled
    dedicated_master_count   = var.master_instance_enabled ? var.master_instance_count : null
    dedicated_master_type    = var.master_instance_enabled ? var.master_instance_type : null

    instance_count = var.instance_count
    instance_type  = var.instance_type

  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  tags = var.tags
}

