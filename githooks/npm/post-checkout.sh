#!/bin/sh
set -e

if $(git diff --name-only $1 $2 | grep -x -q "package-lock.json"); then
    sh ./githooks/npm/common.sh
fi