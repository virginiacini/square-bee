#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df8271f8560ec001ae07044/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df8271f8560ec001ae07044
curl -s -X POST https://api.stackbit.com/project/5df8271f8560ec001ae07044/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df8271f8560ec001ae07044/webhook/build/publish > /dev/null
