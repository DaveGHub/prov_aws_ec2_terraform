output "public_instance_addresses" {
  value = "${formatlist("instance %v has public ip %v", aws_instance.public_instances.*.id, aws_instance.public_instances.*.public_ip)}"
}
