domain          = "das-meta"
instance_type   = "t3.small.elasticsearch"
tag_domain      = "das-meta"
volume_type     = "gp2"
ebs_volume_size = 10


vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.10.0/24"
avail_zone        = "us-east-1b"
env_prefix        = "dev"


alarm_name          = "cluster-status-red"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = "1"
treat_missing_data  = "ignore"