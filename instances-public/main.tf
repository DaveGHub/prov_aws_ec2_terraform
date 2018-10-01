
# public instances
resource "aws_instance" "public_instances" {
  ami               = "${var.pub_ami_id}"
  availability_zone = "${var.pub_sn_az}"
  instance_type     = "${var.pub_instance_type}"
  key_name          = "${var.pub_sn_access}"
  subnet_id         = "${var.pub_sn_id}"

  associate_public_ip_address = true
  source_dest_check = false

  count = 1

  security_groups = [
    "${var.pub_sg_id}"]

  tags = {
    Name = "${var.pub_sn}_${count.index}"
  }
}
