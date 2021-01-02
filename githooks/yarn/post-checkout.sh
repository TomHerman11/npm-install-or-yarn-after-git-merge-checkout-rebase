#!/bin/sh
set -e

if $(git diff --name-only $1 $2 | grep -x -q "yarn.lock"); then
    sh ./githooks/yarn/common.sh
fi