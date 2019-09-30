#!/bin/sh
echo '=================== Create deploy key to push ==================='
mkdir /root/.ssh
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts && \
ssh-keyscan -t rsa gitee.com >> /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa

echo '=================== Sync with mirror git ==================='
git version
git checkout master
git status
git remote set-url --add --push origin ${TARGET_GIT}
git remote -vv
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
echo 'ready to push'
git push origin master
