###############################################################################
# Load Network data from remote statefile
###############################################################################
data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "${path.module}/../prov_aws_vpc_terraform/terraform.tfstate"
  }
}

###############################################################################
# Provider
###############################################################################
provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "${data.terraform_remote_state.network.vpc_region}"
}

## Write the private key to access bastion host in a file
resource "local_file" "bastion_access_key" {
  content  = "${data.terraform_remote_state.network.nat_private_key}"
  filename = "${path.module}/id_rsa_bastion.pem"
}

module "public_instances" {
  source = "./instances-public"

  pub_sn        = "${data.terraform_remote_state.network.subnet_public}"
  pub_sn_az     = "${data.terraform_remote_state.network.subnet_public_az}"
  pub_sn_access = "${data.terraform_remote_state.network.subnet_public_key_name}"
  pub_sn_id     = "${data.terraform_remote_state.network.subnet_public_id}"
  pub_sg_id     = "${data.terraform_remote_state.network.security_group_public_id}"
}

module "private_instances" {
  source = "./instances-private"

  pri_sn_01        = "${data.terraform_remote_state.network.subnet_private_01}"
  pri_sn_01_az     = "${data.terraform_remote_state.network.subnet_private_01_az}"
  pri_sn_01_id     = "${data.terraform_remote_state.network.subnet_private_01_id}"
  pri_sn_01_access = "${data.terraform_remote_state.network.subnet_private_01_key_name}"

  pri_sn_02        = "${data.terraform_remote_state.network.subnet_private_02}"
  pri_sn_02_az     = "${data.terraform_remote_state.network.subnet_private_02_az}"
  pri_sn_02_id     = "${data.terraform_remote_state.network.subnet_private_02_id}"
  pri_sn_02_access = "${data.terraform_remote_state.network.subnet_private_02_key_name}"

  pri_sg_id = "${data.terraform_remote_state.network.security_group_internal_id}"
}
