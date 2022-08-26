#!/bin/bash

# Repeat a Character
# $1 = character to repeat
# $2 = number of times
repeat_characters(){
    for (( i = 0; i < $2; ++i )); do printf "$1"; done
}