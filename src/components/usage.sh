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


render_content()
{

    TABLE_SEPARATOR="${ICON_FV}"

    FLAG_LINE_COUNT=$(line_count "${TABLE_FLAG}")
    WORD_LINE_COUNT=$(line_count "${TABLE_WORD}")
    INFO_LINE_COUNT=$(line_count "${TABLE_INFO}")

    # Find greatest number of three columns
    if [ $FLAG_LINE_COUNT -gt $WORD_LINE_COUNT ] && [ $FLAG_LINE_COUNT -gt $INFO_LINE_COUNT ]; then
        LONGEST_COUNT=$FLAG_LINE_COUNT
    elif [ $WORD_LINE_COUNT -gt $FLAG_LINE_COUNT ] && [ $WORD_LINE_COUNT -gt $INFO_LINE_COUNT ]; then
        LONGEST_COUNT=$WORD_LINE_COUNT
    else
        LONGEST_COUNT=$INFO_LINE_COUNT
    fi

    # Pad each line with newlines to match column with most lines.
    FLAG_PAD=$(( $LONGEST_COUNT - $FLAG_LINE_COUNT ))
    WORD_PAD=$(( $LONGEST_COUNT - $WORD_LINE_COUNT ))
    INFO_PAD=$(( $LONGEST_COUNT - $INFO_LINE_COUNT ))

    # Add pads to each row line
    TABLE_FLAG=$(pad_row "$TABLE_FLAG" $FLAG_PAD)
    TABLE_WORD=$(pad_row "$TABLE_WORD" $WORD_PAD)
    TABLE_INFO=$(pad_row "$TABLE_INFO" $INFO_PAD)

    # Create arrays by newline
    # split by ‰ and make an array of each line
    TABLE_FLAG=${TABLE_FLAG//'\n'/$'‰'}
    TABLE_FLAG=${TABLE_FLAG//$'\n'/$'‰'}
    IFS=$'‰' read -r -a TABLE_FLAG <<< "$TABLE_FLAG"

    TABLE_WORD=${TABLE_WORD//'\n'/$'‰'}
    TABLE_WORD=${TABLE_WORD//$'\n'/$'‰'}
    IFS=$'‰' read -r -a TABLE_WORD <<< "$TABLE_WORD"

    TABLE_INFO=${TABLE_INFO//'\n'/$'‰'}
    TABLE_INFO=${TABLE_INFO//$'\n'/$'‰'}
    IFS=$'‰' read -r -a TABLE_INFO <<< "$TABLE_INFO"

    for (( LINE_LOOP=0; LINE_LOOP<${LONGEST_COUNT}; LINE_LOOP++ ))
    do 

        # LENGTH_WITHOUT_CONTROL_CHARACTERS=$(echo ${TABLE_INFO[$LINE_LOOP]})
        LENGTH_WITHOUT_CONTROL_CHARACTERS=$(echo -e ${TABLE_INFO[$LINE_LOOP]} | sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g');

        # echo ${#TABLE_INFO[$LINE_LOOP]}
        # echo ${#LENGTH_WITHOUT_CONTROL_CHARACTERS}

        if [[ ${#TABLE_INFO[$LINE_LOOP]} == ${#LENGTH_WITHOUT_CONTROL_CHARACTERS} ]]; then
            INFO_PAD_LENGTH=$(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - ${#TABLE_INFO[$LINE_LOOP]} - 3))
        else
            INFO_PAD_LENGTH=$(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - ${#LENGTH_WITHOUT_CONTROL_CHARACTERS} - 4))
        fi

        printf '\t'
        printf "${TABLE_BACKGROUND_BG_COLOUR}"
        printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
        printf '%1s'   "${TABLE_SEPARATOR}"
        printf "${RESET_ALL}"

        printf "${TABLE_BACKGROUND_BG_COLOUR}"
        printf '%-10b' " ${TABLE_FLAG[$LINE_LOOP]}"

        printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
        printf '%1s'   "${TABLE_SEPARATOR}"
        printf "${RESET_ALL}"

        printf "${TABLE_BACKGROUND_BG_COLOUR}"
        printf '%-30b' " ${TABLE_WORD[$LINE_LOOP]}"

        printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
        printf '%1s'   "${TABLE_SEPARATOR}"
        printf "${RESET_ALL}"

        printf "${TABLE_BACKGROUND_BG_COLOUR}"
        printf '%b'    " ${TABLE_INFO[$LINE_LOOP]}"

        printf "%${INFO_PAD_LENGTH}b" " "

        printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
        printf '%1s'   "${TABLE_SEPARATOR}"
        printf "${RESET_ALL}"

        printf '\n'

    done

}


pad_row()
{
    LINE=$1
    ROWS=$2

    # Add newlines to columns
    for ((i=1; i<=$ROWS; i++))
    do
        LINE+=' \n'
    done

    echo $LINE
}



render_header()
{

    
    # top BAR
    HEADER_TOP+="\t"
    HEADER_TOP+="${TABLE_BACKGROUND_BG_COLOUR}"
    HEADER_TOP+="${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    HEADER_TOP+="${ICON_0FF0}"
    HEADER_TOP+=$(repeat_characters "${ICON_FH}" ${FLAG_WIDTH} )
    HEADER_TOP+="${ICON_0FFF}"
    HEADER_TOP+=$(repeat_characters "${ICON_FH}" ${WORD_WIDTH} )
    HEADER_TOP+="${ICON_0FFF}"
    HEADER_TOP+=$(repeat_characters "${ICON_FH}" $(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - 1 - 1 )) )
    HEADER_TOP+="${ICON_00FF}"
    HEADER_TOP+="${RESET_ALL}"

    printf "${HEADER_TOP}\n"

    # header separator line
    TABLE_SEPARATOR="${ICON_FV}"
    DESCRIPTION_WIDTH=$(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - 1  - 1 ))
    printf "\t"
    printf "${TABLE_BACKGROUND_BG_COLOUR}"
    printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    printf "%1s" "${TABLE_SEPARATOR}"
    printf "${RESET_ALL}"

    printf "${TABLE_BACKGROUND_BG_COLOUR}"
    printf "%-${FLAG_WIDTH}s" "-Flag"

    printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    printf "%1s" "${TABLE_SEPARATOR}"
    printf "${RESET_ALL}"

    printf "${TABLE_BACKGROUND_BG_COLOUR}"
    printf "%-${WORD_WIDTH}s" "--Word"

    printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    printf "%1s" "${TABLE_SEPARATOR}"
    printf "${RESET_ALL}"

    printf "${TABLE_BACKGROUND_BG_COLOUR}"
    printf "%-${DESCRIPTION_WIDTH}s" "Description"

    printf "${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    printf "%1s" "${TABLE_SEPARATOR}"
    printf "${RESET_ALL}"
    printf "\n"

    # bottom BAR
    HEADER_BOTTOM+="\t"
    HEADER_BOTTOM+="${TABLE_BACKGROUND_BG_COLOUR}"
    HEADER_BOTTOM+="${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    HEADER_BOTTOM+="${ICON_FFF0}"
    HEADER_BOTTOM+=$(repeat_characters "${ICON_FH}" ${FLAG_WIDTH} )
    HEADER_BOTTOM+="${ICON_FFFF}"
    HEADER_BOTTOM+=$(repeat_characters "${ICON_FH}" ${WORD_WIDTH} )
    HEADER_BOTTOM+="${ICON_FFFF}"
    HEADER_BOTTOM+=$(repeat_characters "${ICON_FH}" $(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - 1 - 1 )) )
    HEADER_BOTTOM+="${ICON_F0FF}"
    HEADER_BOTTOM+="${RESET_ALL}"

    printf "${HEADER_BOTTOM}\n"

}



render_footer()
{
    # bottom BAR
    FOOTER_BOTTOM+="\t"
    FOOTER_BOTTOM+="${TABLE_BACKGROUND_BG_COLOUR}"
    FOOTER_BOTTOM+="${TABLE_STYLE_TEXT_COLOUR}${TABLE_STYLE_BG_COLOUR}"
    FOOTER_BOTTOM+="${ICON_FF00}"
    FOOTER_BOTTOM+=$(repeat_characters "${ICON_FH}" ${FLAG_WIDTH} )
    FOOTER_BOTTOM+="${ICON_FF0F}"
    FOOTER_BOTTOM+=$(repeat_characters "${ICON_FH}" ${WORD_WIDTH} )
    FOOTER_BOTTOM+="${ICON_FF0F}"
    FOOTER_BOTTOM+=$(repeat_characters "${ICON_FH}" $(( ${TABLE_WIDTH} - ${TAB_WIDTH} - 1 - ${FLAG_WIDTH} - 1 - ${WORD_WIDTH} - 1 - 1 )) )
    FOOTER_BOTTOM+="${ICON_F00F}"
    FOOTER_BOTTOM+="${RESET_ALL}"

    printf "${FOOTER_BOTTOM}\n"
}



# Check is file is being passed
if [ "$#" -ne 1 ]; then
    usage
fi

# Run options with input values.
usage $@
