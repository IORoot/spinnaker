#!/bin/bash

printf "\n8-Bit colour codes\n\n"

for code in {0..255}; do 

    PREFIX=''
    if (( $code < 10 )); then 
        PREFIX='00'
    fi
    if (( $code > 9 )) && (( $code < 100 )); then 
        PREFIX='0'
    fi

    printf "${PREFIX}${code} \e[38;5;${code}m"; 

    ((($code+20) % 36 == 0)) && printf "\n"
    
done
printf "\n"