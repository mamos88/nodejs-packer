variable "profile" {
  default = "packer"
}

variable "region" {
  default = "us-east-2"
}

variable "ami_name" {
  default = "nojejs-hello-amazon-linux"
}

variable "source_ami" {
  default = "ami-0866a04d72a1f5479"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_username" {
  default = "ec2-user"
}

variable "file_source" {
  default = "hellonode.js"
}

variable "file_destination" {
  default = "/tmp/hellonode.js"
}

variable "shell_script" {
  default = "app-server.sh"
}

variable "post_processor_output" {
  default = "output.json"
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = var.ami_name
  profile       = var.profile
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
  ssh_username  = var.ssh_username

  tags = {
    Name = var.ami_name
  }
}

build {
  name = "nodejs-packer-amazon"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "file" {
    source = "hellonode.js"
    destination = "/tmp/hellonode.js"
  }
  
    provisioner "file" {
    source = "hello.service"
    destination = "/tmp/hello.service"
  }

    provisioner "shell" {
    script = "./setup.sh"
  }
}

