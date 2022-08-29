#!/bin/bash

source ${SPINNAKER_TOOLS_FOLDER}/utils/json_values.sh
source ${SPINNAKER_TOOLS_FOLDER}/select/select_option.sh
PARSER="${SPINNAKER_TOOLS_FOLDER}/utils/parse_json.sh -l"

function usage(){
    printf "${TEXT_RED_500}Illegal number of parameters\n"
    printf "${TEXT_GREEN_500}usage:\n"
    printf "\t${TEXT_GRAY_200}$0 ${TEXT_SKY_500}<config-file.yaml>\n"
    exit 1
}


function options(){

    # Take first arg as Config file
    CONFIG_FILE=$1

    # Run file through the parser
    JSON_PARSED=$($PARSER < $CONFIG_FILE)

    # Store the length of select array
    JSON_SELECT_LENGTH=$(getarrlen select)

    SELECT_ARRAY=()
    # Loop through select object to get each array
    for (( LOOP=0; LOOP<${JSON_SELECT_LENGTH}; LOOP++ ))
    do 

        # Create the variables
        declare LOOP_SELECT_INDEX=$LOOP
        declare LOOP_SELECT_TITLE=$(getkey select[$LOOP].title)
        declare LOOP_SELECT_DESCRIPTION=$(getkey select[$LOOP].description)
        declare LOOP_SELECT_STYLE=$(getkey select[$LOOP].style)
        declare LOOP_SELECT_COMMAND=$(getkey select[$LOOP].command)
        LOOP_SELECT_COMMAND=${LOOP_SELECT_COMMAND//\\/}  # Remove the forward escape slashes in the command field

        # Create the menu option

        # Create a box
        BOX=$(./box.sh "${LOOP_SELECT_STYLE}"  "${ICON_ROCKET}${LOOP_SELECT_TITLE}\n$LOOP_SELECT_DESCRIPTION")
        VALUE=$( printf "$BOX" )
        SELECT_ARRAY+=("${VALUE}")

        # Create environment variables of results
        declare SELECT_ARRAY_INDEX_$LOOP="${LOOP_SELECT_INDEX}"
        declare SELECT_ARRAY_TITLE_$LOOP="${LOOP_SELECT_TITLE}"
        declare SELECT_ARRAY_DESCRIPTION_$LOOP="${LOOP_SELECT_DESCRIPTION}"
        declare SELECT_ARRAY_STYLE_$LOOP="${LOOP_SELECT_STYLE}"
        declare SELECT_ARRAY_COMMAND_$LOOP="${LOOP_SELECT_COMMAND}"

    done


    select_option "${SELECT_ARRAY[@]}"
    choice=$?

    echo "Choosen index = $choice"
}

# Check is file is being passed
if [ "$#" -ne 1 ]; then
    usage
fi

# Run options with input values.
options $@