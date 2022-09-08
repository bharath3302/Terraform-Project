# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "subnet1_cidr" {
  default = "192.168.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "subnet2_cidr" {
  default = "192.168.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet3_cidr" {
  default = "192.168.3.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet4_cidr" {
  default = "192.168.4.0/24"
}
variable "vpc_id" {
  type    = string
  default = "aws_vpc.terraform-vpc.id"
}