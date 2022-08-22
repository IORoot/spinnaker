#!/bin/bash

if [[ ! $# -eq 2 ]]; then
    printf "usage: \n"
    printf "$0 [starting codepoint] [length]\n"
    printf "\n"
    exit 1
fi

increment=0x000001
HEXCODE="0x$(printf "%06s" $1)"
LENGTH=$2
DISPLAYWIDTH=8

# Colours
GREEN='\e[38;5;48m'
PINK='\e[38;5;207m'
WHITE='\e[0m'

for((loop=1;loop<=$LENGTH;loop++))
do

    # Print hexcode
    HEXCODE=$(printf '%#X' $HEXCODE)

    # Create codepoint (remove the 0x)
    CODEPOINT=${HEXCODE:2}

    # Pad with zeros to make 8-characters long
    PADDED_CODEPOINT=$(printf "%08s" $CODEPOINT)

    # Send to the unicodeToEmoji.sh script
    EMOJI=$(./unicodeToEmoji.sh $PADDED_CODEPOINT)

    # Print to screen
    printf "${GREEN}%6s : ${WHITE}%-2s  " ${HEXCODE:2} $EMOJI

    # Newline every number of loops
    (($loop % $DISPLAYWIDTH == 0)) && printf "\n"

    # Increment hexcode by one.
    HEXCODE=$(($HEXCODE + $increment))
done

printf "\n"