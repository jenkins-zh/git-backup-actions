# Git repo backup Action

GitHub Action for backup your git repository.

## Supported Git Provider

* [gitee](https://gitee.com)
* [CodeChina](https://codechina.csdn.net/)

## Create Deploy Key

1. Generate deploy key `ssh-keygen -t rsa -f git-backup -q -N ""`
2. Then go to "Settings > Deploy Keys" of the target repository
3. Add your public key within "Allow write access" option.
4. Copy your private deploy key to `GIT_DEPLOY_KEY` secret in your source git repository of "Settings > Secrets"

## Environment Variables

- `GIT_DEPLOY_KEY`: **Required**, your deploy key (ssh private key) which has **Write access**
- `TARGET_GIT`: **required**, your backup git repository (please use ssh or git protocol)
- `BRANCH`: **required**, the branch you want to backup

```
name: Backup Git Repository

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
      uses: jenkins-zh/git-backup-actions@v0.0.1
      env:
        GIT_DEPLOY_KEY: ${{ secrets.GIT_DEPLOY_KEY }}
        TARGET_GIT: "git@gitee.com:surenpi/surenpi.git"
        BRANCH: master
```
