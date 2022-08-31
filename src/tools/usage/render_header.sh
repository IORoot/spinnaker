
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