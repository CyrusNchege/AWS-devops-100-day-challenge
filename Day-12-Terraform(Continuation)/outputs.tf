output "instance_id" {
    description = "value of instance id"
    value = aws_instance.Cyrus-terraform-instance.id
}

output "instance_public_ip" {
    description = "value of instance public ip"
    value = aws_instance.Cyrus-terraform-instance.public_ip
}
