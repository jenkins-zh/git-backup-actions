#!/bin/sh
echo '=================== Create deploy key to push ==================='
mkdir /root/.ssh
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa

echo '=================== Sync with mirror git ==================='
git remote set-url --add --push origin ${TARGET_GIT}
git push
