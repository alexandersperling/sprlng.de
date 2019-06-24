#!/bin/sh

mkdir /root/.ssh
ssh-keyscan sprlng.de > /root/.ssh/known_hosts
echo "{SSH_KEY}" > temp_id_rsa
chmod 600 temp_id_rsa
ssh -i temp_id_rsa yolped@sprlng.de "rm -r /var/www/sprlng.de/*" || true
echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
scp -r -i temp_id_rsa ./src yolped@sprlng.de:/var/www/sprlng.de
rm -rf temp_id_rsa
