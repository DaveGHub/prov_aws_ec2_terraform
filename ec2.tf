# Setup our aws provider
provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "${var.vpc_region}"
}

# instances
resource "aws_instance" "ec2Instances" {

  count = 1 //${var.inst_count}
  ami = "${var.inst_ami}"
  availability_zone = "${lookup(var.availability_zone, var.vpc_region)}"
  instance_type = "${var.inst_type}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${var.vpc_public_sn_id}"
  associate_public_ip_address = true
  source_dest_check = false

  security_groups = [
    "${var.vpc_public_sg_id}"]

  tags = {
    Name = "ec2Instances${count.index}"
  }
}

output "ec2_ins_0_ip" {
  value = "${aws_instance.ec2Instances.0.public_ip}"
}