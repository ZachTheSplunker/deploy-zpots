resource "aws_instance" "zpot" {
  ami                         = var.debian_ami[var.aws.region]
  instance_type               = var.aws.instance_type
  key_name                    = var.aws.private_key
  subnet_id                   = var.ec2_subnet_id
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = true
  user_data = templatefile("${path.module}/user_data.tftpl", { timezone = var.zpot.timezone, password = var.zpot.linux_password, tpot_flavor = var.zpot.tpot_flavor, web_user = var.zpot.web_user, web_password = var.zpot.web_password })

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "20"
    delete_on_termination = "true"
  }

  tags = {
    Name = "zpot-sensor"
  }

  provisioner "remote-exec" {
    inline = ["echo 'sleep time!' && sleep 15s && echo 'Go Time!'"]

    connection {
      type        = "ssh"
      user        = "admin"
      host        = self.public_ip
      private_key = file(var.aws.private_key_path)
    }
  }

  provisioner "local-exec" {
    working_dir = "../ansible"
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u admin --private-key ${var.aws.private_key_path} -i '${self.public_ip},' site_bootstrap.yml -e 'ansible_python_interpreter=/usr/bin/python3'"
  }

}