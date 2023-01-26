variable "domain" {
  type = string
  description = "Name of the domain."
}
variable "instance_type" {
  type = string
  description = "Type of the instance"
}
variable "tag_domain" {
  type = string
  description = "Tag of the domain."
}
variable "volume_type" {
  type = string
  description = "EBS volume type"
}
variable "ebs_volume_size" {}
  description = "EBS volume size"
variable "elasticsearch_version" {
  type    = string
  default = "7.10"
  description = "Version of elastic search"
}

variable "vpc_cidr_block" {
  description = "CIDR ip range"
  type = string
}

variable "subnet_cidr_block" {
  description = "CIDR ip range"
  type = string
}

variable "avail_zone" {
  type = list(string)
  description = "List of vpc availability zones"
}

variable "env_prefix" {
  type = string
  description = "Prefix for environment. Can be used for multistaged environment."
}


variable "sns_name" {
  default = "red-alert-sns"
  description = "sns alarm name"
}



variable "alarm_name" {
  description = "Domain name of checking service."
}

variable "comparison_operator" {
  description = "Comparison operator."
}

variable "evaluation_periods" {
  description = "Evaluation period."
}

variable "treat_missing_data" {
  description = "Treat missing data."
}



variable "alarm_unavailable_period" {
  type    = number
  default = 60
  description = "unavailable time period "

}

variable "dashboard_name" {
  type = string
  default = "newdashboard"
  description = "Cloudwatch dashboard name"
}