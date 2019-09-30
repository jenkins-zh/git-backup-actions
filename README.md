# Git repo backup Action

GitHub Action for backup your git repo.

**restriction**

Now, only `https://gitee.com` is supported.

## Secrets

- `GIT_DEPLOY_KEY` - *Required* your deploy key which has **Write access**

## Create Deploy Key

1. Generate deploy key `ssh-keygen -t rsa -f hugo -q -N ""`
1. Then go to "Settings > Deploy Keys" of repository
1. Add your public key within "Allow write access" option.
1. Copy your private deploy key to `GIT_DEPLOY_KEY` secret in "Settings > Secrets"

## Environment Variables

- `HUGO_VERSION` : **optional**, default is **0.54.0** - [check all versions here](https://github.com/gohugoio/hugo/releases)
- `TARGET_GIT` : **required**, your backup git repo (please use ssh or git protocol)

```
name: Deploy to GitHub Pages

on:
  push:
    branches:
    - master

jobs:
  git-repo-backup:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: git-repo-backup
      uses: jenkins-zh/git-backup-actions@master
      env:
        GIT_DEPLOY_KEY: ${{ secrets.GIT_DEPLOY_KEY }}
        TARGET_GIT: "git@gitee.com:surenpi/surenpi.git"
```
