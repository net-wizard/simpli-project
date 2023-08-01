provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "demo-instance" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.demo-sg.name]
  key_name                    = "demo-key"

  

   connection {
    type = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.demo-private.private_key_pem
    host = "${aws_instance.demo-instance.public_ip}"
  }

  provisioner "file" {
    source      = "installation-scripts"
    destination = "/tmp/installation-scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installation-scripts/install-jenkins.sh",
      "/tmp/installation-scripts/install-jenkins.sh",
      "chmod +x /tmp/installation-scripts/install-ansible.sh",
      "/tmp/installation-scripts/install-ansible.sh",
      "chmod +x /tmp/installation-scripts/install-docker.sh",
      "/tmp/installation-scripts/install-docker.sh",
      "chmod +x /tmp/installation-scripts/setting.sh",
      "/tmp/installation-scripts/setting.sh",
    ]
  }


  tags = {
    Name = "demo-instance"
  }
}

output "instance-ip" {
  value = aws_instance.demo-instance.public_ip
}