output "ec2_subnet_id" {
    description = "IDs of the VPC's public subnets"
    value = module.vpc.public_subnets[0]
}

output "sg_vpc_id" {
    description = "ID for zpot security group"
    value = aws_security_group.zpot_default.id
}