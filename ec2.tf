resource "aws_instance" "webserver" {
  ami                    = "ami-0c1ac8a41498c1a9c"
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnet.existing.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF2
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl enable apache2
              systemctl start apache2

              echo "<h1>Project 1 Web Server</h1>" > /var/www/html/index.html
              EOF2

  tags = {
    Name = "friend-project1-webserver"
  }
}
