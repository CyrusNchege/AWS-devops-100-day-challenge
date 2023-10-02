provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "Cyrus-terraform-instance" {
    ami = "ami-0f3769c8d8429942f"
    instance_type = "t2.micro"

    tags = {
        Name = var.instance_name
    }
}