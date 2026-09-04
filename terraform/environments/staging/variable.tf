variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "eks_node_count" {
  type = number
}

variable "eks_node_min_size" {
  type    = number
  default = 1
}

variable "eks_node_max_size" {
  type    = number
  default = 2
}

variable "eks_instance_type" {
  type = string
}

variable "eks_root_volume_size" {
  type    = number
  default = 30
}