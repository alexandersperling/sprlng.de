#!/bin/sh

DOMAIN=$1
chmod 600 temp_id_rsa
mkdir /root/.ssh
ssh-keyscan vision.sprlng.de > /root/.ssh/known_hosts
echo "########## Deploying ${CI_COMMIT_SHORT_SHA} to prod ##########"
scp -r -i temp_id_rsa ./src "yolped@vision.sprlng.de:/home/yolped/services/$DOMAIN"
ssh -i temp_id_rsa yolped@vision.sprlng.de "cd ~/services/$DOMAIN && docker-compose down && docker-compose pull && docker-compose up -d"
rm -rf temp_id_rsa
