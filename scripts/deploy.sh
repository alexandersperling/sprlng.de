#!/bin/sh

mkdir /root/.ssh
ssh-keyscan sprlng.de > /root/.ssh/known_hosts
chmod 600 "${SSH_KEY}"
ssh -i "${SSH_KEY}" yolped@sprlng.de "rm -r /var/www/sprlng.de/*" || true
echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
scp -r -i "${SSH_KEY}" ./src yolped@sprlng.de:/var/www/sprlng.de
