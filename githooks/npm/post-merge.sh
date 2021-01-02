#!/bin/sh
set -e

if $(git diff --name-only HEAD^ HEAD | grep -x -q "package-lock.json"); then
    sh ./githooks/npm/common.sh
fi