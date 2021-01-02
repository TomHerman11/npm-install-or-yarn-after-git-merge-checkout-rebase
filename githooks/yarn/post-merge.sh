#!/bin/sh
set -e

if $(git diff --name-only HEAD^ HEAD | grep -x -q "yarn.lock"); then
    sh ./githooks/yarn/common.sh
fi