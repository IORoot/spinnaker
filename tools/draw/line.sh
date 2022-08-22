#!/bin/bash

line()
{

    WIDTH=10
    STYLE="-"

    # Test if second argument is passed.
    if ! [[ -z $2 ]] ; then
        STYLE=$2
    fi

    # Test if it is a number
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] ; then
        WIDTH=$1
    fi

    for ((i=1; i<=$WIDTH; i++)); do 
        printf $STYLE; 
    done

}

line $1 $2