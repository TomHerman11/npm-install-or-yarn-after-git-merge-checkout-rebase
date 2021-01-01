#!/bin/sh
set -e

has_file_updated () {
    # git diff:
    # - '--name-only' - output file names that changed
    # - 'HEAD^ HEAD' -  find differences between last commit (HEAD^) and current code (HEAD)
    
    # grep:
    # - '-x' - select only matches that exactly match the whole line.
    # - '-q' - do not output the matched text but only return the exit status code
    
    # $1: the first argument passed to this function
    
    git diff --name-only HEAD^ HEAD | grep -x -q $1
}

# use colors in our message:
YELLOW='\033[1;33m'
RED='\033[1;31m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color

echo_attention() {
    echo -e "${YELLOW}Attention!${NC}"
}

if has_file_updated "package-lock.json"; then
    echo_attention
    echo -e "${RED}package-lock.json${NC} has been updated! You should run ${RED}npm install${NC}."

elif has_file_updated "yarn.lock"; then
    echo_attention
    echo -e "${BLUE}yarn.lock${NC} has been updated! You should run ${BLUE}yarn${NC}."

fi