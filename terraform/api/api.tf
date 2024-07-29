resource "aws_instance" "api" {
  ami                    = "ami-0075ef908dba2df0a"
  instance_type          = "t2.micro"
  subnet_id              = element(var.subnets, 0)
  associate_public_ip_address = true
  security_groups        = [aws_security_group.api.id]
  key_name               = var.key_name
  user_data              = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                git clone https://git.toptal.com/henrique/node-3tier-app2
                cd node-3tier-app2/api
                npm install
                PORT=8080 DB=${var.db_name} DBUSER=${var.db_user} DBPASS=${var.db_password} DBHOST=${var.db_host} DBPORT=${var.db_port} npm start
              EOF
  tags = {
    Name = "api-instance"
  }
}





resource "aws_security_group" "api" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
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

output "security_group_id" {
  value = aws_security_group.api.id
}
