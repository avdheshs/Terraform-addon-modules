resource "aws_key_pair" "example" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = {
    Name = var.key_name
  }
}

output "key_name" {
  value = aws_key_pair.example.key_name
}

output "key_fingerprint" {
  value = aws_key_pair.example.fingerprint
}
