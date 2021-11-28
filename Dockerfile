FROM alpine:3.15.0

ENV VERSION=0.1.0
ENV GITHUB_HEAD_REF = ""

ARG VERSION

# Github labels
LABEL "com.github.actions.name"="IFTTT Webhook ACTION"
LABEL "com.github.actions.description"="IFTTT Webhook PUSH"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="black"

LABEL "repository"="https://github.com/funnyzak/ifttt-webhook-action"
LABEL "homepage"="https://github.com/funnyzak"
LABEL "maintainer"="funnyzak <silenceace@gmail.com>"
LABEL "version"=$VERSION

RUN apk add --update --no-cache bash curl

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
