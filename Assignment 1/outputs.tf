output "web_instance_public_ip" {
  value = aws_instance.web_instance.public_ip
}

output "app_instance_id" {
  value = aws_instance.app_instance.id
}