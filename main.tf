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
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "${data.terraform_remote_state.network.vpc_region}"
}

module "public_instances" {
  source = "./instances-public"

  pub_sn        = "${data.terraform_remote_state.network.public_subnet}"
  pub_sn_az     = "${data.terraform_remote_state.network.public_subnet_az}"
  pub_sn_access = "${data.terraform_remote_state.network.public_subnet_access}"
  pub_sn_id     = "${data.terraform_remote_state.network.public_subnet_id}"
  pub_sg_id     = "${data.terraform_remote_state.network.public_security_group_id}"
}