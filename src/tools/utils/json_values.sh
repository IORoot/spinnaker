#!/bin/bash

#https://github.com/dominictarr/JSON.sh/issues/37

#function to get value of specified key
#returns empty string if not found
#warning - does not validate key format (supplied as parameter) in any way, simply returns empty string for malformed queries too
#usage: VAR=$(getkey foo.bar) #get value of "bar" contained within "foo"
#       VAR=$(getkey foo[4].bar) #get value of "bar" contained in the array "foo" on position 4
#       VAR=$(getkey [4].foo) #get value of "foo" contained in the root unnamed array on position 4
function getkey {
    #reformat key string (parameter) to what JSON.sh uses
    KEYSTRING=$(sed -e 's/\[/\"\,/g' -e 's/^\"\,/\[/g' -e 's/\]\./\,\"/g' -e 's/\./\"\,\"/g' -e '/^\[/! s/^/\[\"/g' -e '/\]$/! s/$/\"\]/g' <<< "$@")
    #extract the key value
    FOUT=$(grep -F "$KEYSTRING" <<< "$JSON_PARSED")
    FOUT="${FOUT#*$'\t'}"
    FOUT="${FOUT#*\"}"
    FOUT="${FOUT%\"*}"
    echo "$FOUT"
}

#function returning length of array
#returns zero if key in parameter does not exist or is not an array
#usage: VAR=$(getarrlen foo.bar) #get length of array "bar" contained within "foo"
#       VAR=$(getarrlen) #get length of the root unnamed array
#       VAR=$(getarrlen [2].foo.bar) #get length of array "bar" contained within "foo", which is stored in the root unnamed array on position 2
function getarrlen {
    #reformat key string (parameter) to what JSON.sh uses
    # KEYSTRING=$(sed -e '/^\[/! s/\[/\"\,/g' -e 's/\]\./\,\"/g' -e 's/\./\"\,\"/g' -e '/^$/! {/^\[/! s/^/\[\"/g}' -e '/^$/! s/$/\"\,/g' -e 's/\[/\\\[/g' -e 's/\]/\\\]/g' -e 's/\,/\\\,/g' -e '/^$/ s/^/\\\[/g' <<< "$@")
    KEYSTRING=$(sed -e '/^\[/! s/\[/\"\,/g' -e 's/\]\./\,\"/g' -e 's/\./\"\,\"/g' -e '#^$#! {/^\[/! s/^/\[\"/g}' -e '/^$/! s/$/\"\,/g' -e 's/\[/\\\[/g' -e 's/\]/\\\]/g' -e 's/\,/\\\,/g' -e '/^$/ s/^/\\\[/g' <<< "$@")
    #extract the key array length - get last index
    LEN=$(grep -o "${KEYSTRING}[0-9]*" <<< "$JSON_PARSED" | tail -n -1 | grep -o "[0-9]*$")
    #increment to get length, if empty => zero
    if [ -n "$LEN" ]; then
        LEN=$(($LEN+1))
    else
        LEN="0"
    fi
    echo "$LEN"
}