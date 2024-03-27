data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "~> 5.6.0"
  name                 = "vpc_zpot"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.33.0/24"]
  enable_dns_hostnames = true
}

resource "aws_security_group" "zpot_default" {
  name        = "sg_zpot_public_subnet"
  description = "zpot Public Subnets"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow TCP ports to zpot"
    from_port   = 0
    to_port     = 64000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow UDP ports to zpot"
    from_port   = 0
    to_port     = 64000
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Management access to Cockpit"
    from_port   = 64294
    to_port     = 64294
    protocol    = "tcp"
    cidr_blocks = split(",", var.aws.ip_allowlist)
  }

  ingress {
    description = "Management access to SSH"
    from_port   = 64295
    to_port     = 64295
    protocol    = "tcp"
    cidr_blocks = split(",", var.aws.ip_allowlist)
  }

  ingress {
    description = "Management access to NGINX"
    from_port   = 64297
    to_port     = 64297
    protocol    = "tcp"
    cidr_blocks = split(",", var.aws.ip_allowlist)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "zpot"
  }

}