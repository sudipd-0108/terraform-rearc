#!/bin/bash
export PATH=/usr/local/bin:$PATH;

yum update
yum install docker -y
service docker start

yum install git -y
cd /root
git clone https://github.com/rearc/quest
cat <<EOF >/root/quest/Dockerfile
FROM node:10

# Create app directory
WORKDIR /opt/quest

COPY package.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .


EXPOSE 3000
CMD [ "npm", "start" ]
EOF
cd /root/quest
docker build -t quest:v1 .
docker container run -p 3000:3000 -e SECRET_WORD='quest001001222' -d quest:v1 

