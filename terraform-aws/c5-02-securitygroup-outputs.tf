output "public_bastion_sg_group_id" {
  description = "The ID of the security group"
  value       = module.public_sg.this_security_group_id
}

