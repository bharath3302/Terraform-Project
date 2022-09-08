provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA6ARM3XGVUISR456N"
  secret_key = "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"
}

# Creating EC2 instance in Private Subnet
resource "aws_instance" "demoinstance" {
  ami           = "ami-0b89f7b3f054b957e"
  instance_type = "t2.micro"
  key_name      = "terraform-test"
  # vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  vpc_security_group_ids = [aws_security_group.demosg.id]
  subnet_id              = aws_subnet.demosubnet2.id
  tags = {
    Name = "My Private Instance"
  }
}