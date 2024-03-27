output "admin_ui" {
    value = aws_instance.zpot.public_dns
}

output "ssh_access" {
  value = aws_instance.zpot.public_dns
}

output "web_ui" {
  value = aws_instance.zpot.public_dns
}