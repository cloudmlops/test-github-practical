// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = false
  enable_dns_support   = false

  tags = {
    Name = "terraform_test_vpc"
  }
}

// Here this IGW resource will be created in the VPC created in this file itself.
resource "aws_internet_gateway" "terraform_test_internet_gateway" {
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "tf_igw"
  }
}