#!/bin/bash

# Create all of the vertical padding lines
# that are above and below the text content.
# Sets up the variables:
#
# @return MULTI_PY_LINES (Y-Axis)
# @return MULTI_PT_LINES (Top)
# @return MULTI_PB_LINES (Bottom)
vertical_padding()
{

    # Y-PADDING LINE 
    #
    # INDIRECTION NOT SETUP CORRECTLY!
    # not using PREFIX
    #
    # Create the [Y, Top, Bottom] empty space for vertical padding 
    # ░░░░░░░░░░░░░░░░
    declare TMP_VERTICAL=$(repeat_characters " " ${!TMP_WIDTH})
    #printf "TMP_VERTICAL: |${TMP_VERTICAL}|\n"


    # Y-PADDING LINE + EDGES
    #
    # Create the vertical spacer padding line with edges
    # │░░░░░░░░░░░░░░░░│
    declare "${PREFIX}_VERTICAL_LINE"="${!TMP_BG_COLOUR}${!TMP_EDGE_L}${TMP_VERTICAL}${!TMP_EDGE_R}${RESET_BG} \n"
    local TMP_VERTICAL_LINE="${PREFIX}_VERTICAL_LINE"
    # printf "TMP_VERTICAL_LINE: ${!TMP_VERTICAL_LINE}\n"


    # Override with HEIGHT setting
    # Removing the number of lines too.
    #
    # echo "LINE_COUNT:$LINE_COUNT"
    if ! [ -z ${BOX_H} ]; then
        BOX_PY=$(( (${BOX_H} / 2) - $LINE_COUNT ))
    fi

    # PY-PADDING LINES (Top and Bottom)
    #
    # Generate the vertical padding lines
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ ${!TMP_PY} -eq "0" ]; then
        MULTI_PY_LINES=$(repeat_characters "${BOX_VERTICAL_LINE}" $BOX_PY )
        MULTI_PY_LINES="$MULTI_PY_LINES\n"
    fi
    # printf "MULTI_PY_LINES:\n$MULTI_PY_LINES"


    # TOP Y-PADDING LINES
    #
    # Generate the TOP padding lines if its set
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ ${!TMP_PT} -eq "0" ]; then
        MULTI_PT_LINES=$(repeat_characters "${BOX_VERTICAL_LINE}" $BOX_PT )
        MULTI_PT_LINES="$MULTI_PT_LINES\n"
    fi
    # printf "\nMULTI_PT_LINES:\n$MULTI_PT_LINES"


    # BOTTOM Y-PADDING LINES
    #
    # Generate the BOTTOM padding lines if its set
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ ${!TMP_PB} -eq "0" ]; then
        MULTI_PB_LINES=$(repeat_characters "${BOX_VERTICAL_LINE}" $BOX_PB )
        MULTI_PB_LINES="$MULTI_PB_LINES\n"
    fi
    # printf "\nMULTI_PB_LINES:\n$MULTI_PB_LINES"
    

}