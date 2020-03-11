#####
# AWS
#####
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.14"
}

# available variables: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/local.tf

# asg min size cf:
#   https://github.com/terraform-aws-modules/terraform-aws-eks/pull/517/files
#   https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/autoscaling.md
variable "eks_asg_min_size" {
  description = "AutoScaling Group Min Size (scales up but not down)"
  type        = number
  default     = 1
}

variable "eks_asg_max_size" {
  description = "AutoScaling Group Max Size"
  type        = number
  default     = 3
}

variable "eks_asg_desired_capacity" {
  description = "AutoScaling Group Desired Capacity (unused)"
  type        = number
  default     = 1
}

variable "eks_worker_group_1_instance_type" {
  description = "Worker Group 1 Instance Type"
  type        = string
  default     = "t3.small"
}

variable "aws_admin_public_key" {
  description = "AWS Administrative SSH Public Key"
  type        = string
  default     = "ssh-rsa unset"
}
