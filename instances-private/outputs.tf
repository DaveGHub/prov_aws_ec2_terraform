output "private_sn_01_addresses" {
  value = "${formatlist("instance %v has private ip %v", aws_instance.sn_01_instances.*.id, aws_instance.sn_01_instances.*.private_ip)}"
}

output "private_sn_02_addresses" {
  value = "${formatlist("instance %v has private ip %v", aws_instance.sn_02_instances.*.id, aws_instance.sn_02_instances.*.private_ip)}"
}
