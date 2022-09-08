# Creating Public Subnet 

resource "aws_subnet" "Public_demosubnet-1" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public demosubnet-1"
  }
}
resource "aws_subnet" "Public_demosubnet-2" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public_demosubnet-2"
  }
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "demogateway" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "demo-gateway"
  }
}
# Creating Route Table for Public Subnet
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demogateway.id
  }
  tags = {
    Name = "Public Subnet Route Table"
  }
}
resource "aws_route_table_association" "rt_associate_public" {
  subnet_id      = aws_subnet.Public_demosubnet-1.id
  route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "rt_associate_public-2" {
  subnet_id      = aws_subnet.Public_demosubnet-2.id
  route_table_id = aws_route_table.rt.id
}

# Creating Private subnet

resource "aws_subnet" "demosubnet1" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "Private Subnet one"
  }
}
resource "aws_subnet" "demosubnet2" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "Private Subnet two"
  }
}

# Creating Route table for Private Subnet

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "Route Table for the Private Subnet"
  }
}
resource "aws_route_table_association" "rt_associate_private" {
  subnet_id      = aws_subnet.demosubnet1.id
  route_table_id = aws_route_table.rt_private.id
}
resource "aws_route_table_association" "rt_associate_private_2" {
  subnet_id      = aws_subnet.demosubnet2.id
  route_table_id = aws_route_table.rt_private.id
}