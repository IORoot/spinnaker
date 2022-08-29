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

    # Clear the screen
    clear

    # Run file through the parser
    JSON_PARSED=$($PARSER < $CONFIG_FILE)

    # Store the length of select array
    JSON_SELECT_LENGTH=$(getarrlen select.options)
    JSON_OPTION_HEIGHT=$(getarrlen select.config.option_height)
    

    SELECT_ARRAY=()
    # Loop through select object to get each array
    for (( LOOP=0; LOOP<${JSON_SELECT_LENGTH}; LOOP++ ))
    do 

        # Create the variables
        declare LOOP_SELECT_INDEX=$LOOP
        declare LOOP_SELECT_TITLE=$(getkey select.options[$LOOP].title)
        declare LOOP_SELECT_TITLE_STYLE=$(getkey select.options[$LOOP].title_style)
        declare LOOP_SELECT_DESCRIPTION=$(getkey select.options[$LOOP].description)
        declare LOOP_SELECT_DESCRIPTION_STYLE=$(getkey select.options[$LOOP].description_style)
        declare LOOP_SELECT_COMMAND=$(getkey select.options[$LOOP].command)
        declare LOOP_SELECT_HEIGHT=$(getkey select.options[$LOOP].height)
        declare LOOP_SELECT_SIDEBAR_STYLE=$(getkey select.options[$LOOP].sidebar_style)

        # Remove the forward escape slashes in the command field
        LOOP_SELECT_COMMAND=${LOOP_SELECT_COMMAND//\\/}  


        # DEFAULT STYLES
        TITLE_STYLE_TEXT_COLOUR="${TEXT_GRAY_100}"
        DESCRIPTION_STYLE_TEXT_COLOUR="${TEXT_GRAY_400}"
        SIDELINE_STYLE_BORDER_COLOUR="${BORDER_GRAY_900}"

        # OVERRIDES
        #
        # Source and run the parse_classes script.
        # This will override any default variables
        # by setting them to supplied user values.
        #
        # @return $PREFIX_VARIABLE
        source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes.sh "TITLE_STYLE" "${LOOP_SELECT_TITLE_STYLE}"
        source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes.sh "DESCRIPTION_STYLE" "${LOOP_SELECT_DESCRIPTION_STYLE}"

        # Add to array
        SELECT_ARRAY+=("")

        # Create environment variables of results
        declare SELECT_ARRAY_INDEX_$LOOP="${LOOP_SELECT_INDEX}"
        declare SELECT_ARRAY_TITLE_$LOOP="${LOOP_SELECT_TITLE}"
        declare SELECT_ARRAY_TITLE_STYLE_$LOOP="${LOOP_SELECT_TITLE_STYLE}"
        declare SELECT_ARRAY_DESCRIPTION_$LOOP="${LOOP_SELECT_DESCRIPTION}"
        declare SELECT_ARRAY_DESCRIPTION_STYLE_$LOOP="${LOOP_SELECT_DESCRIPTION_STYLE}"
        declare SELECT_ARRAY_COMMAND_$LOOP="${LOOP_SELECT_COMMAND}"
        declare SELECT_ARRAY_HEIGHT_$LOOP="${LOOP_SELECT_HEIGHT}"
        declare SELECT_ARRAY_SIDEBAR_STYLE_$LOOP="${LOOP_SELECT_SIDEBAR_STYLE}"

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