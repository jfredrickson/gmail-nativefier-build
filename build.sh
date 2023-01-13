#!/bin/sh

PLATFORM="linux"
ARCH="x64"
NAME="Gmail"

nativefier https://mail.google.com/ --name ${NAME} --honest --strict-internal-urls

# Change package name from 'gmail-nativefier-XXXXXX' to 'Gmail'
sed -i -E "s/gmail-nativefier-.{6}/${NAME}/" ${NAME}-${PLATFORM}-${ARCH}/resources/app/package.json

