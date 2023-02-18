#!/bin/sh

set -ex

basedir=$(dirname ${0})
${basedir}/bin/setup

# Homebrew does not allow sudo.
case "$(uname)" in
  "Darwin")  ${basedir}/bin/mitamae local "$@" ${basedir}/lib/recipe.rb ;;
  *) sudo -E ${basedir}/bin/mitamae local "$@" ${basedir}/lib/recipe.rb ;;
esac
