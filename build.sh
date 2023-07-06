#!/bin/bash
tagname=0.0.2
hostname=promtail
sudo docker stop $hostname
sudo docker rm $hostname
git pull
sudo docker build --no-cache -t jgajardog/$hostname:$tagname .
sudo docker run --rm --name $hostname -h $hostname -d -p 7514:7514 jgajardog/$hostname:$tagname
sudo docker push jgajardog/$hostname:$tagname
echo "sudo docker run --rm --name $hostname -h $hostname -d -p 7514:7514 jgajardog/$hostname:$tagname"

