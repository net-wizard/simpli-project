resource "aws_key_pair" "ec2-key" {
  key_name   = "demo-key"
  public_key = tls_private_key.demo-private.public_key_openssh
}

resource "local_file" "key-gen" {
  content         = tls_private_key.demo-private.private_key_pem
  filename        = "demo-key.pem"
  file_permission = "0400"
}

resource "tls_private_key" "demo-private" {
  algorithm = "RSA"
  rsa_bits  = 4096
}