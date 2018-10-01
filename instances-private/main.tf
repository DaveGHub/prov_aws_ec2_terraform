# private instances in subnet 01
resource "aws_instance" "sn_01_instances" {
  ami               = "${var.pri_ami_id}"
  availability_zone = "${var.pri_sn_01_az}"
  instance_type     = "${var.pri_instance_type}"
  key_name          = "${var.pri_sn_01_access}"
  subnet_id         = "${var.pri_sn_01_id}"

  associate_public_ip_address = false
  source_dest_check = false

  # NOTE: due to an existing issue in terraform: https://github.com/hashicorp/terraform/issues/953,
  # modules cannot be provided with a "count" attribute. Hence this needs to be handled
  # as part of module implementation or in the main.tf file
  count = 1

  vpc_security_group_ids = [
    "${var.pri_sg_id}"]

  tags = {
    Name = "${var.pri_sn_01}_${count.index}"
  }
}

# private instances in subnet 02
resource "aws_instance" "sn_02_instances" {
  ami               = "${var.pri_ami_id}"
  availability_zone = "${var.pri_sn_02_az}"
  instance_type     = "${var.pri_instance_type}"
  key_name          = "${var.pri_sn_02_access}"
  subnet_id         = "${var.pri_sn_02_id}"

  associate_public_ip_address = false
  source_dest_check = false

  count = 1

  vpc_security_group_ids = [
    "${var.pri_sg_id}"]

  tags = {
    Name = "${var.pri_sn_02}_${count.index}"
  }
}
