#!/bin/sh

echo "########## Deploying ${CI_COMMIT_TAG} to prod ##########"
ssh -i "${SSH_KEY}" "rm -r /var/www/sprlng.de/*" || true
scp -r -i "${SSH_KEY}" ./src yolped@sprlng.de:/var/www/sprlng.de
