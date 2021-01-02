#!/bin/sh
set -e

# use colors in our message:
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Attention!${NC}"
echo -e "${RED}package-lock.json${NC} has been updated! running ${RED}npm install${NC}."
npm install