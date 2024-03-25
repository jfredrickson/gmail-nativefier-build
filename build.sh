#!/bin/sh

PLATFORM="linux"
ARCH="x64"
NAME="Gmail"
DIR="${NAME}-${PLATFORM}-${ARCH}"

nativefier https://mail.google.com/ --name ${NAME} --honest --strict-internal-urls

# Change package name from 'gmail-nativefier-XXXXXX' to 'Gmail'
sed -i -E "s/gmail-nativefier-.{6}/${NAME}/" ${DIR}/resources/app/package.json

# Fix permissions
find ${DIR} -type f -exec chmod go+r {} \;
find ${DIR} -type d -exec chmod go+rx {} \;

