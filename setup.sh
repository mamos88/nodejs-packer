#!/bin/bash

sudo yum update -y
sudo yum install nodejs -y

mkdir /home/ec2-user/helloapp
cp /tmp/hellonode.js /home/ec2-user/helloapp/
# chown -R ec2-user:ec2-user /home/ec2-user/helloapp

sudo cp /tmp/hello.service /etc/systemd/system
sudo systemctl enable hello.service
