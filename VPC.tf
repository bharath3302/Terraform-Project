# Creating VPC
resource "aws_vpc" "terraform-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Terraform VPC"
  }
}