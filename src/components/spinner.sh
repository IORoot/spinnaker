#!/bin/bash
tput civis

# Clear Line
CL="\e[2K"
# Spinner Character
SPINNER="𛰀𛱃𛱄𛱅○𛱅𛱄𛱃𛰀"

function spinner() {
    TASK=$1
    MESSAGE=$2
    while :; do
        jobs %1 > /dev/null 2>&1 
        [ $? = 0 ] || {
            printf "${TEXT_EMERALD_500}${ICON_TICK}${RESET_ALL} ${TASK} ${TEXT_EMERALD_500}Done${RESET_ALL}\n"
            break
        }

        if [ $? -ne 0 ]; then
            printf "${TEXT_RED_500}${ICON_CROSS}${RESET_ALL} ${TASK} ${TEXT_RED_500}Failed${RESET_ALL}\n"
            break
        fi

        for (( i=0; i<${#SPINNER}; i++ )); do
            sleep 0.05
            printf "${TEXT_AMBER_500}${SPINNER:$i:1}${RESET_ALL} ${TASK} ${TEXT_AMBER_500}${MESSAGE}${RESET_ALL}\r"
        done
    done
}

MESSAGE="${2-InProgress}"
TASK="${3-$1}"

if [[ ! -z "${4}" ]]; then
    SPINNER=$(echo -n "${4//[[:space:]]/}")
fi

if [[ ! -z "${5}" ]]; then
    $1 > /dev/null 2>&1 & spinner "$TASK" "$MESSAGE"
else
    $1 & spinner "$TASK" "$MESSAGE"
fi

tput cnorm