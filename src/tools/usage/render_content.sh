
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