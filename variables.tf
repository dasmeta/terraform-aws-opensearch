variable "domain" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "tag_domain" {
  type = string
}
variable "volume_type" {
  type = string
}
variable "ebs_volume_size" {}

variable "elasticsearch_version" {
  type    = string
  default = "7.10"
}

variable "vpc_cidr_block" {

}

variable "subnet_cidr_block" {

}

variable "avail_zone" {

}

variable "env_prefix" {

}


variable "sns_name" {
  default = "red-alert-sns"
}



variable "alarm_name" {

}

variable "comparison_operator" {

}

variable "evaluation_periods" {

}

variable "treat_missing_data" {

}



variable "alarm_unavailable_period" {
  type    = number
  default = 60

}