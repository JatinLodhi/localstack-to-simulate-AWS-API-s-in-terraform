provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "useast2"
  region = "us-east-2"
}

module "useast1" {
  source        = "./aws_instance"
  providers     = {
    aws = aws.useast1
  }
  region        = "us-east-1"
  instance_type = "t2.small"
}

module "useast2" {
  source        = "./aws_instance"
  providers     = {
    aws = aws.useast2
  }
  region        = "us-east-2"
  instance_type = "t2.small"
}

output "useast1_instance_id" {
  value = module.useast1.instance_id
}

output "useast1_instance_public_ip" {
  value = module.useast1.instance_public_ip
}

output "useast2_instance_id" {
  value = module.useast2.instance_id
}

output "useast2_instance_public_ip" {
  value = module.useast2.instance_public_ip
}
