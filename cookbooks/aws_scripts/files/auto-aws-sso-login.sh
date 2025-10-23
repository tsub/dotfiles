#!/bin/sh -eu

# `alias terragrunt="scripts/auto-aws-sso-login.sh terragrunt"` のような利用を想定
# `$1` には terragrunt, aws, kubectl コマンド、`$2` 以降にはそのサブコマンドが入る想定

if [ "$(printenv AWS_PROFILE)" != "" ] && [ "$2" != "hclfmt" ] && [ "$2" != "sso" ] && ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "Session expired, logging in to AWS SSO..."
    aws sso login
fi

"$@"
