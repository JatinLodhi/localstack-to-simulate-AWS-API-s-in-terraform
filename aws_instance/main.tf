variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.small"
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"
}

resource "aws_instance" "main" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (for example)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
}
