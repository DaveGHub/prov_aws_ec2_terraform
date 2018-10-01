output "public_instances_key" {
  value = "${data.terraform_remote_state.network.public_subnet_access}"
}

output "public_instances" {
  value = "${module.public_instances.public_instance_addresses}"
}
