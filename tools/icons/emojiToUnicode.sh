#!/bin/bash

ICON=$1
DEBUG=$2

CODEPOINT=$(curl -s "https://graphemica.com/${ICON}" | tr -d '\n'| awk -F '<title>' '{print $2}' | awk -F '</title>' '{print $1}')

if [ -z $DEBUG ]; then
    CODEPOINT=$(echo ${CODEPOINT}| cut -d "+" -f2 | cut -d ")" -f1)
fi

echo $CODEPOINT