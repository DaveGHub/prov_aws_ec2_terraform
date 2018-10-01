variable "pub_sn" {}
variable "pub_sn_id" {}
variable "pub_sn_az" {}
variable "pub_sn_access" {}
variable "pub_sg_id" {}

variable "pub_ami_id" {
  # Ubuntu 18.04LTS 64 bit HVM
  description = "Amazon Machine Image for the Instance in public subnet"
  default     = "ami-0f65671a86f061fcd"
}

variable "pub_instance_type" {
  description = "type of instances to provision in public subnet"
  default     = "t2.micro"
}
