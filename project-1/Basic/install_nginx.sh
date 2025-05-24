#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable mginx

echo "<h1> Terraform In One Shot by TWS </h1>" > /var/www/html/index.html