output "key_name" {
  description = "The name of the key pair."
  value       = aws_key_pair.example.key_name
}

output "key_fingerprint" {
  description = "The fingerprint of the key pair."
  value       = aws_key_pair.example.fingerprint
}
