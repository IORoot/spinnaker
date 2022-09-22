#!/bin/bash


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
# │            Parse Classes            │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes_func.sh

# ┌─────────────────────────────────────┐
# │                                     │
# │             Parse JSON              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/parse_json.sh

# ┌─────────────────────────────────────┐
# │                                     │
# │            Usage Message            │
# │                                     │
# └─────────────────────────────────────┘
function usage(){
    printf "${TEXT_RED_500}Illegal number of parameters\n"
    printf "${TEXT_GREEN_500}usage:\n"
    printf "\t${TEXT_GRAY_200}$0 ${TEXT_SKY_500}<config-file.json> (-debug)\n"
    exit 1
}


# ┌─────────────────────────────────────┐
# │                                     │
# │            ProgressList             │
# │                                     │
# └─────────────────────────────────────┘
progresslist()
{
    CONFIG_FILE=$1

    # Run file through the parser
    # JSON_PARSED=$(cat ${CONFIG_FILE} | parse_json -l )
    JSON_PARSED=$(parse_json -l < $CONFIG_FILE)

    # Get number of tasks
    JSON_TASKS_LENGTH=$(getarrlen progresslist.tasks)

    # Display Command output?
    JSON_TASKS_COMMAND_OUTPUT=$(getkey progresslist.command_output)

    # Which spinner to use?
    JSON_TASKS_SPINNER=$(getkey progresslist.spinner)

    # Loop through object to get each array
    for (( LOOP=0; LOOP<${JSON_TASKS_LENGTH}; LOOP++ ))
    do 
        # Create the variables
        declare LOOP_TASK_INDEX=$LOOP
        declare LOOP_TASK_TITLE=$(getkey progresslist.tasks[$LOOP].title)
        declare LOOP_TASK_COMMAND=$(getkey progresslist.tasks[$LOOP].command)

        # Remove the forward escape slashes in the command field
        LOOP_SELECT_COMMAND=${LOOP_SELECT_COMMAND//\\/}  

        run_command "${LOOP_TASK_TITLE}" "${LOOP_TASK_COMMAND}"

    done
}

run_command()
{
    TITLE=$1
    COMMAND=$2

    if [ "$JSON_TASKS_COMMAND_OUTPUT" == off ]; then
        SILENT='on'
    fi

    $SPINNAKER_COMPONENTS_FOLDER/spinner.sh "${COMMAND}" "Working" "${TITLE}" "${!JSON_TASKS_SPINNER}" $SILENT
}

# Check is file is being passed
if [ "$#" -lt 1 ]; then
    usage
    exit 0
fi

# Run options with input values.
progresslist $@