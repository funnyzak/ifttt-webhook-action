#!/bin/sh

set -x

GITHUB_HEAD_REF=$GITHUB_HEAD_REF
GITHUB_REF=$GITHUB_REF
GITHUB_SHA=$GITHUB_SHA
GITHUB_REPOSITORY=$GITHUB_REPOSITORY
GITHUB_ACTOR=$GITHUB_ACTOR
GITHUB_WORKFLOW=$GITHUB_WORKFLOW
GITHUB_BASE_REF=$GITHUB_BASE_REF
GITHUB_EVENT_NAME=$GITHUB_EVENT_NAME
GITHUB_WORKSPACE=$GITHUB_WORKSPACE
GITHUB_ACTION=$GITHUB_ACTION
GITHUB_EVENT_PATH=$GITHUB_EVENT_PATH

if [ -z "$INPUT_KEY" ]; then
  echo "You must specify webhook key."
  exit 0
fi

if [ -z "$INPUT_EVENT" ]; then
  echo "You must specify event name."
  exit 0
fi

curl -X POST -H "Content-Type: application/json" -d "{\"value1\":\"${INPUT_VALUE1}\",\"value2\":\"${INPUT_VALUE2}\",\"value3\":\"${INPUT_VALUE3}\"}" https://maker.ifttt.com/trigger/${INPUT_EVENT}/with/key/${INPUT_KEY}

