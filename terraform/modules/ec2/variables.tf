variable "environment" {
  type        = string
  description = "Environment name"
}

variable "create_bastion" {
  type        = bool
  description = "Whether to create the bastion/helper instance"
  default     = false
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the bastion instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet where the bastion will be created"
}

variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name for SSM"
}

variable "root_volume_size" {
  type        = number
  description = "Root EBS volume size in GB"
  default     = 30
}