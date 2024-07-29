resource "aws_instance" "web" {
  ami                    = "ami-0075ef908dba2df0a"
  instance_type          = "t2.micro"
  subnet_id              = element(var.subnets, 0)
  associate_public_ip_address = true
  security_groups        = [aws_security_group.web.id]
  key_name               = var.key_name
  user_data              = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                git clone https://git.toptal.com/henrique/node-3tier-app2
                cd node-3tier-app2/web
                npm install
                npm start
              EOF
  tags = {
    Name = "web-instance"
  }
}


resource "aws_security_group" "web" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
