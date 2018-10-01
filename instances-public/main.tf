# public instances
resource "aws_instance" "public_instances" {
  ami               = "${var.pub_ami_id}"
  availability_zone = "${var.pub_sn_az}"
  instance_type     = "${var.pub_instance_type}"
  key_name          = "${var.pub_sn_access}"
  subnet_id         = "${var.pub_sn_id}"

  associate_public_ip_address = true
  source_dest_check           = false

  # NOTE: due to an existing issue in terraform: https://github.com/hashicorp/terraform/issues/953,
  # modules cannot be provided with a "count" attribute. Hence this needs to be handled
  # as part of module implementation or in the main.tf file
  count = 1

  vpc_security_group_ids = [
    "${var.pub_sg_id}",
  ]

  tags = {
    Name = "${var.pub_sn}_${count.index}"
  }
}
