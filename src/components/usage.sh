#!/bin/bash

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
# │          Repeat characters          │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/repeat_characters.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │             Line Count              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/line_count.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │           Render Content            │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/usage/render_content.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │            Render Header            │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/usage/render_header.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │            Render Footer            │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/usage/render_footer.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │               Pad Row               │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/usage/pad_row.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │            Main function            │
# │                                     │
# └─────────────────────────────────────┘
usage()
{
    # Take first arg as Config file
    CONFIG_FILE=$1

    # Run file through the parser
    JSON_PARSED=$(parse_json -l < $CONFIG_FILE)

    # Store the length of select array
    JSON_SELECT_LENGTH=$(getarrlen usage)

    # Loop through select object to get each array
    for (( LOOP=0; LOOP<${JSON_SELECT_LENGTH}; LOOP++ ))
    do 
        # Create the variables
        LOOP_USAGE_INDEX=$LOOP
        LOOP_USAGE_TYPE=$(getkey usage[$LOOP].type)

        # Run the function named that type. 
        # 'paragraph', 'table'
        if ! [[ -z ${LOOP_USAGE_TYPE} ]]; then
            ${LOOP_USAGE_TYPE} $LOOP
        fi

    done
}


paragraph()
{
    INDEX=$1

    TITLE_STYLE_TEXT_COLOUR=''
    TITLE_STYLE_BG_COLOUR=''

    DETAIL_STYLE_TEXT_COLOUR=''
    DETAIL_STYLE_BG_COLOUR=''


    # Get Values
    PARAGRAPH_TITLE=$(getkey usage[$LOOP].title)
    PARAGRAPH_TITLE_STYLE=$(getkey usage[$LOOP].title_s)
    PARAGRAPH_DETAIL=$(getkey usage[$LOOP].detail)
    PARAGRAPH_DETAIL_STYLE=$(getkey usage[$LOOP].detail_s)

    # Render any icons, etc...
    PARAGRAPH_DETAIL=$(eval "printf \"${PARAGRAPH_DETAIL}\"")

    # @return $PREFIX_VARIABLE
    # printf "PARAGRAPH_STYLES:$PARAGRAPH_STYLES"
    parse_classes "TITLE_STYLE" "${PARAGRAPH_TITLE_STYLE}"
    parse_classes "DETAIL_STYLE" "${PARAGRAPH_DETAIL_STYLE}"

    # Print title
    printf "%b%s%b\n" "${TITLE_STYLE_BG_COLOUR}${TITLE_STYLE_TEXT_COLOUR}" "$PARAGRAPH_TITLE" "$RESET_ALL"

    PARAGRAPH_DETAIL=${PARAGRAPH_DETAIL//'\n'/$'‰'}
    PARAGRAPH_DETAIL=${PARAGRAPH_DETAIL//$'\n'/$'‰'}
    IFS=$'‰' read -r -a PARAGRAPH_DETAIL <<< "$PARAGRAPH_DETAIL"

    PARAGRAPH_LINE_LENGTH="${#PARAGRAPH_DETAIL[@]}"

    # Loop through lines and print
    for (( DETAIL_LOOP=0; DETAIL_LOOP<${PARAGRAPH_LINE_LENGTH}; DETAIL_LOOP++ ))
    do 
        printf "\t%b%b%b\n" "${DETAIL_STYLE_BG_COLOUR}${DETAIL_STYLE_TEXT_COLOUR}" "${PARAGRAPH_DETAIL[DETAIL_LOOP]}" "$RESET_ALL"
    done
    
}



table()
{
    INDEX=$1

    TITLE_STYLE_TEXT_COLOUR=''
    TITLE_STYLE_BG_COLOUR=''

    TABLE_STYLE_TEXT_COLOUR=''
    TABLE_STYLE_BG_COLOUR=''
    TABLE_BACKGROUND_BG_COLOUR=''

    # Get Values
    TABLE_TITLE=$(getkey usage[$LOOP].title)
    TABLE_TITLE_STYLE=$(getkey usage[$LOOP].title_s)
    TABLE_STYLE=$(getkey usage[$LOOP].style)
    TABLE_BACKGROUND=$(getkey usage[$LOOP].background)

    # @return $PREFIX_VARIABLE
    # printf "PARAGRAPH_STYLES:$PARAGRAPH_STYLES"
    parse_classes "TITLE_STYLE" "${TABLE_TITLE_STYLE}"
    parse_classes "TABLE_STYLE" "${TABLE_STYLE}"
    parse_classes "TABLE_BACKGROUND" "${TABLE_BACKGROUND}"

    # Store the length of table array
    TABLE_LENGTH=$(getarrlen usage[$LOOP].rows)

    # Output title
    printf "%b%s%b\n" "${TITLE_STYLE_BG_COLOUR}${TITLE_STYLE_TEXT_COLOUR}" "$TABLE_TITLE" "$RESET_ALL"

    # Output the header of the table
    declare TABLE_WIDTH=$(( $(tput cols) ))
    declare FLAG_WIDTH=10
    declare WORD_WIDTH=30
    declare TAB_WIDTH=8

    # output the header
    render_header

    # Loop through select object to get each array
    for (( TABLE_LOOP=0; TABLE_LOOP<${TABLE_LENGTH}; TABLE_LOOP++ ))
    do 
        declare TABLE_FLAG=$(getkey usage[$LOOP].rows[$TABLE_LOOP].flag)
        declare TABLE_WORD=$(getkey usage[$LOOP].rows[$TABLE_LOOP].word)
        declare TABLE_INFO=$(getkey usage[$LOOP].rows[$TABLE_LOOP].info)

        TABLE_FLAG=$(eval "printf \"%b\" \"${TABLE_FLAG}\"")
        TABLE_WORD=$(eval "printf \"%b\"  \"${TABLE_WORD}\"")
        TABLE_INFO=$(eval "printf \"%b\"  \"${TABLE_INFO}\"")

        


        # output each text line
        render_content 

        if [[ ${TABLE_LOOP} < $(( ${TABLE_LENGTH} - 1 ))   ]]; then
            # separator BAR
            SEPARATOR_LINE="\t"
            SEPARATOR_LINE+="${TABLE_BACKGROUND_BG_COLOUR}"
            SEPARATOR_LINE+="${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
            SEPARATOR_LINE+="${ICON_FFF0}"
            SEPARATOR_LINE+=$(repeat_characters "${ICON_FH}" ${FLAG_WIDTH} )
            SEPARATOR_LINE+="${ICON_FFFF}"
            SEPARATOR_LINE+=$(repeat_characters "${ICON_FH}" ${WORD_WIDTH} )
            SEPARATOR_LINE+="${ICON_FFFF}"
            SEPARATOR_LINE+=$(repeat_characters "${ICON_FH}" $(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - 1 - 1 )) )
            SEPARATOR_LINE+="${ICON_F0FF}"
            SEPARATOR_LINE+="${RESET_ALL}"

            printf "${SEPARATOR_LINE}\n"
        fi

    done

    # output the footer
    render_footer
}





# Check is file is being passed
if [ "$#" -ne 1 ]; then
    usage
fi

# Run options with input values.
usage $@
