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
    private_key = "${file("demo-key.pem")}"
    host = "${aws_instance.demo-instance.public_ip}"
  }

  provisioner "file" {
    source      = "install-jenkins.sh"
    destination = "/tmp/install-jenkins.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-jenkins.sh",
      "/tmp/install-jenkins.sh",
    ]
  }


  tags = {
    Name = "demo-instance"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.demo-instance.public_ip} > ./hosts"
  }
}

output "instance-ip" {
  value = aws_instance.demo-instance.public_ip
}