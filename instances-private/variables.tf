variable "pri_sn_01" {}
variable "pri_sn_01_id" {}
variable "pri_sn_01_az" {}
variable "pri_sn_01_access" {}

variable "pri_sn_02" {}
variable "pri_sn_02_id" {}
variable "pri_sn_02_az" {}
variable "pri_sn_02_access" {}

variable "pri_sg_id" {}

variable "pri_ami_id" {
  # Ubuntu 18.04LTS 64 bit HVM
  description = "Amazon Machine Image for the Instance in private subnets"
  default     = "ami-0f65671a86f061fcd"
}

variable "pri_instance_type" {
  description = "type of instances to provision in private subnets"
  default     = "t2.micro"
}
