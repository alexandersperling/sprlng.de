#!/bin/sh

DOMAIN=$1
chmod 600 temp_id_rsa
mkdir /root/.ssh
ssh-keyscan sprlng.de > /root/.ssh/known_hosts
ssh -i temp_id_rsa yolped@sprlng.de "rm -r /var/www/$DOMAIN/*" || true
echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
scp -r -i temp_id_rsa ./src "yolped@sprlng.de:/var/www/$DOMAIN"
rm -rf temp_id_rsa
