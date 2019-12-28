#!/bin/sh

DOMAIN=$1
chmod 600 temp_id_rsa
mkdir /root/.ssh
ssh-keyscan vision.sprlng.de > /root/.ssh/known_hosts
ssh -i temp_id_rsa yolped@vision.sprlng.de "rm -r /var/www/$DOMAIN/*" || true
echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
scp -r -i temp_id_rsa ./src/ "yolped@vision.sprlng.de:/home/yolped/services/$DOMAIN/data/"
ssh -i temp_id_rsa yolped@vision.sprlng.de "cd ~/services/$DOMAIN && docker-compose down && docker-compose pull && docker-compose up -d"
rm -rf temp_id_rsa
