  
FROM alpine:latest

LABEL "repository"="https://github.com/jenkins-zh/git-gh-actions"
LABEL "homepage"="https://github.com/jenkins-zh/git-gh-actions"
LABEL "maintainer"="Rick <rick@jenkins-zh.cn>"

LABEL "Version"="0.0.1"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk add --no-cache \
        git \
        openssh-client \
        libc6-compat \
        libstdc++

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]