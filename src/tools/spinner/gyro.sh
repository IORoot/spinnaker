#!/bin/bash
_SPINNER_POS=0
_TASK_OUTPUT=""
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)
BOLD=$(tput bold)

gyro() {
	FUNCTION_NAME="$2"
	VARIABLE_NAME="${3:-}"

    _TASK_OUTPUT=""
    local delay=0.05
    local list=( ${SPIN_LEVEL} )
    local i=$_SPINNER_POS
    local tempfile
    tempfile=$(mktemp)

    eval $FUNCTION_NAME >> $tempfile 2>/dev/null &
    local pid=$!

    tput sc
    printf "%s %s" "${list[i]}" "$1"
    tput el
    tput rc

    i=$(($i+1))
    i=$(($i%10))

    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        printf "%s" "${CYAN}${list[i]}${NORMAL}"
        i=$(($i+1))
        i=$(($i%10))
        sleep $delay
        printf "\b\b\b"
    done
    _TASK_OUTPUT="$(cat $tempfile)"
    rm -f $tempfile
    _SPINNER_POS=$i

    if [ -z $VARIABLE_NAME ]; then :; else
      eval $VARIABLE_NAME=\'"$_TASK_OUTPUT"\'
    fi
}
