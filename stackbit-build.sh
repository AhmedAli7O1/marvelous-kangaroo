#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e22ff636bd1f2001a4617cf/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e22ff636bd1f2001a4617cf
curl -s -X POST https://api.stackbit.com/project/5e22ff636bd1f2001a4617cf/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e22ff636bd1f2001a4617cf/webhook/build/publish > /dev/null
