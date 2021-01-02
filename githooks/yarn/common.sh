#!/bin/sh
set -e

# use colors in our message:
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Attention!${NC}"
echo -e "${BLUE}yarn.lock${NC} has been updated! running ${BLUE}yarn${NC}."
yarn