resource "aws_launch_configuration" "web_lc" {
  name_prefix     = "web-lc-"
  image_id        = "ami-0075ef908dba2df0a"
  instance_type   = "t2.micro"
  security_groups = [var.web_security_group_id]
  key_name        = var.key_name
  user_data       = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                git clone https://git.toptal.com/henrique/node-3tier-app2
                cd node-3tier-app2/web
                npm install
                npm start
              EOF
}

resource "aws_launch_configuration" "api_lc" {
  name_prefix     = "api-lc-"
  image_id        = "ami-0075ef908dba2df0a"
  instance_type   = "t2.micro"
  security_groups = [var.api_security_group_id]
  key_name        = var.key_name
  user_data       = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                git clone https://git.toptal.com/henrique/node-3tier-app2
                cd node-3tier-app2/api
                npm install
                PORT=8080 DB=${var.db_name} DBUSER=${var.db_user} DBPASS=${var.db_password} DBHOST=${var.db_host} DBPORT=${var.db_port} npm start
              EOF
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = var.subnets
  launch_configuration = aws_launch_configuration.web_lc.id
}

resource "aws_autoscaling_group" "api_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = var.subnets
  launch_configuration = aws_launch_configuration.api_lc.id
}
