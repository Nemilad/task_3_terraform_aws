provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_instance" "instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  user_data = <<-EOF
        #!/bin/bash
        echo "Hello world" > index.html
        nohup busybox httpd -f -p 8080 &
        EOF

  vpc_security_group_ids = [aws_security_group.asg_instance.id]
        
  tags = {
    Name = "terraform_webpage"
  }
}

resource "aws_security_group" "asg_instance" {
  name = "terraform-asg"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

