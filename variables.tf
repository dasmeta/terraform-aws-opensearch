# variable "aws_access_key" {
#   default = "AKIAYHLZZFMQIK3SSVII"
# }

# variable "aws_secret_key" {
#   default = "SZIoJzdxPPoRhds1GJPxbBnNIsJ7y3SiE2jSzGD9"
# }

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