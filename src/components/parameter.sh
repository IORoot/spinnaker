#!/bin/bash

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/

# ┌─────────────────────────────────────┐
# │                                     │
# │             Parse JSON              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/parse_json.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │       JSON Get particular key       │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/json_get_key.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │      JSON Get length of array       │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/json_get_array_length.sh

# ┌─────────────────────────────────────┐
# │                                     │
# │            Main function            │
# │                                     │
# └─────────────────────────────────────┘
function parameters()
{

    PASSED_VALUES=$@

    # Run file through the parser
    JSON_PARSED=$(parse_json -l < $PARAMETER_CONFIG_FILE)

    # Store the length of array
    JSON_PARAMETERS_LENGTH=$(getarrlen parameters)

    # Loop through JSON object to get each array
    for (( PARAMETERS_LOOP=0; PARAMETERS_LOOP<${JSON_PARAMETERS_LENGTH}; PARAMETERS_LOOP++ ))
    do 
        # Create the variables
        LOOP_PARAMETER_TYPE=$(getkey parameters[$PARAMETERS_LOOP].type)

        # Run the function named that type. 
        # 'flag', 'file', 'string', 'stdin', etc...
        if ! [[ -z ${LOOP_PARAMETER_TYPE} ]]; then
            ${LOOP_PARAMETER_TYPE} $PARAMETERS_LOOP $PASSED_VALUES
        fi

    done
}

# ┌─────────────────────────────────────┐
# │                                     │
# │              Flag Type              │
# │                                     │
# └─────────────────────────────────────┘
function flag()
{

    LOOP_INDEX=$1

    # This shift is used to remove $1 (LOOP INDEX)
    # or basically does:
    # set -- "${@:2}"
    # And leaves us with the rest of the user input.
    shift

    USER_INPUT=$@

    # printf "LOOP_INDEX:$LOOP_INDEX\n"
    # printf "FULL USER_INPUT:$USER_INPUT\n"

    # Get current defined parameter
    PARAMETER_FLAG="-" # prefix with minus sign
    PARAMETER_FLAG+=$(getkey parameters[$LOOP_INDEX].flag)
    PARAMETER_WORD=$(getkey parameters[$LOOP_INDEX].word)
    PARAMETER_COMMAND=$(getkey parameters[$LOOP_INDEX].command)

    # Array to save original arguments to.
    POSITIONAL_ARGS=()

    # Loop through all of the user-inputs (IFS is spaces)
    while [[ $# -gt 0 ]]; do

        # echo "current count: $#"
        # echo "CURRENT USER_INPUT: $1"
        # echo "JSON PARAMETER_FLAG: $PARAMETER_FLAG"
        if [[ $1 == $PARAMETER_FLAG ]]; then
            # echo "FLAG FOUND! $1"
            printf "FLAG FOUND: %-5s %-10s %s\n" "-$PARAMETER_FLAG" "--$PARAMETER_WORD" "$PARAMETER_COMMAND"
            run_command "$PARAMETER_COMMAND"
        fi

        # Remove current $1 to get next flag.
        shift

    done

    set -- "${USER_INPUT[@]}" # restore original parameters

}

function file()
{
    echo "file"
}


function string()
{
    echo "string"
}


function stdin()
{
    echo "stdin"
}

function run_command()
{
    COMMAND=$1
    printf "Running command: $COMMAND \n"
    eval "$COMMAND"
}


# Check is file is being passed
# if [ "$#" -ne 1 ]; then
#     parameters
# fi

# Run options with input values.
parameters $@