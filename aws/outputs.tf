output "SSH_Access" {
  value = "ssh -i ${var.aws.private_key_path} -p 64295 admin@${module.zpot.ssh_access}"
}