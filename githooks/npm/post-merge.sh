#!/bin/sh
set -e

if $(git diff --name-only HEAD^ HEAD | grep -x -q $1); then
    sh common.sh
fi