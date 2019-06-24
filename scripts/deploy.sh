#!/bin/sh

VERSION=$1
OLD_VERSION=$2

echo "${SSH_KEY}" > temp_rsa
chmod 400 temp_rsa
echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
scp -i temp_rsa yolped@sprlng.de:/home/yolped/sprlng.de
ssh -i temp_rsa "rm -rf /var/www/sprlng.de/$OLD_VERSION && cp -R sprlng.de /var/www/sprlng.de/$VERSION"

