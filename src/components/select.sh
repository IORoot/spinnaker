#!/bin/bash

PARSER="${SPINNAKER_TOOLS_FOLDER}/utils/parse_json.sh -l"

function usage(){
    printf "${TEXT_RED_500}Illegal number of parameters\n"
    printf "${TEXT_GREEN_500}usage:\n"
    printf "\t${TEXT_GRAY_200}$0 ${TEXT_SKY_500}<config-file.yaml>\n"
    exit 1
}

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



function options(){

    CONFIG_FILE=$1

    JSON_PARSED=$($PARSER < $CONFIG_FILE)

    JSON_SELECT_LENGTH=$(getarrlen select)


    for (( LOOP=0; LOOP<${JSON_SELECT_LENGTH}; LOOP++ ))
    do 
        LOOP_SELECT_TITLE=$(getkey select[$LOOP].title)
        LOOP_SELECT_DESCRIPTION=$(getkey select[$LOOP].description)
        LOOP_SELECT_STYLE=$(getkey select[$LOOP].style)
        LOOP_SELECT_COMMAND=$(getkey select[$LOOP].command)
        COMMAND=${LOOP_SELECT_COMMAND//\\/}
        
        echo "title: ${LOOP_SELECT_TITLE}"
        echo "description: ${LOOP_SELECT_DESCRIPTION}"
        echo "style: ${LOOP_SELECT_STYLE}"
        echo "command: ${LOOP_SELECT_COMMAND}"
        echo "running:"
        eval "${COMMAND}"
        echo "---"
        

    done


    # for JSONLINE in $JSON; do
    #     echo "LINE: ${JSONLINE}"
    # done

    # # Configure the shell prompt PS3 variable to ask for a choice.
    # PS3='Please enter your choice: '

    # # Create an Array of choices
    # options=("Option 1" "Option 2" "Option 3" "Quit")

    # # Parse array
    # select opt in "${options[@]}"
    # do
    #     case $opt in
    #         "Option 1")
    #             echo "you chose choice 1"
    #             ;;
    #         "Option 2")
    #             echo "you chose choice 2"
    #             ;;
    #         "Option 3")
    #             echo "you chose choice $REPLY which is $opt"
    #             ;;
    #         "Quit")
    #             break
    #             ;;
    #         *) echo "invalid option $REPLY";;
    #     esac
    # done

}

# Check is file is being passed
if [ "$#" -ne 1 ]; then
    usage
fi

# Run options with input values.
options $@