
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