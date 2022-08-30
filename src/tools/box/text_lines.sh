#!/bin/bash

# CREATE PADDED TEXT-LINES
#
# Knowing the maximum width of each line "$BOX_WIDTH"
# We can generate the correct amount of padding to
# keep the box size consistent.
#
# │ textbox here 123 │
# │ abcde            │
# │ fgh              │
# │ ijklmnopq        │
#
# The difficulty is emojis. These are double-width
# characters.
#
text_lines()
{
    
    TEXT_STRING=$1
    TEXT_LINES=""

    # REPLACE NEWLINES
    #
    # replace any '\n' (newlines) with ‰
    STRING_ARRAY=${TEXT_STRING//'\n'/$'‰'}
    STRING_ARRAY=${STRING_ARRAY//$'\n'/$'‰'}


    # SPLIT INTO ARRAY
    #
    # split by ‰ and make an array of each line
    IFS=$'‰' read -r -a ARRAY_OF_LINES <<< "$STRING_ARRAY"


    # LOOP 
    #
    # Loop through Array to add extra padding
    # Generate a text-line for each line in array
    # ARRAY_OF_LINES[1] = "textline 1 🚀"
    # ARRAY_OF_LINES[2] = "text 2"
    # ARRAY_OF_LINES[3] = "text line three 🏠"
    for CURRENT_LINE in "${ARRAY_OF_LINES[@]}"; do


        # CURRENT LINE LENGTH
        #
        # @int 20
        local LENGTH_OF_CURRENT_LINE=${#CURRENT_LINE}
        # printf "LENGTH_OF_CURRENT_LINE (before emoji adjustment): $LENGTH_OF_CURRENT_LINE "


        # EMOJIS 🏠
        #
        # Each emoji is 2-character width
        # So we need to REMOVE one padding space for each line that also has an
        # emoji.
        #
        # example:
        #
        # 123🚀
        # line 1 has an emoji. It is four characters long.
        # But represents FIVE because the emoji is double.
        # It's the longest line and needs no extra padding.
        #
        # ABCD
        # line 2 is FOUR characters. ABCD
        # It requires only 1 padding character to match the
        # longest line.
        #
        # X🏠
        # line 3 is TWO characrers with an emoji. The emoji
        # is double, so takes up 3-Characters. It requires
        # TWO padding because of this.
        # 
        local LINE_EMOJI_COUNT=0
        if [[ $CURRENT_LINE = *[![:ascii:]]* ]]; then
        
            # Substitute all emoji for another weird symbol
            local WEIRD_LINE="${CURRENT_LINE//[^[:ascii:]]/∑}"
            
            # Normal string without weird characters.
            local NO_EMOJI_LINE=${WEIRD_LINE//∑/}

            # Length of normal string without weird characters
            local NO_EMOJI_LINE=${#NO_EMOJI_LINE}
            
            # Difference between full line and line without emoji.
            local LINE_EMOJI_COUNT=$(( $LENGTH_OF_CURRENT_LINE - $NO_EMOJI_LINE  ))

            # Each emoji takes 2-characters, so double the number of characters
            # for each emoji present.
            local LENGTH_OF_CURRENT_LINE=$(( $LENGTH_OF_CURRENT_LINE + $LINE_EMOJI_COUNT ))
        fi
        # printf "(after emoji adjustment) : $LENGTH_OF_CURRENT_LINE. "
        # printf "LINE_EMOJI_COUNT: ${LINE_EMOJI_COUNT} \n"



        # RIGHT-PADDING
        #
        # Set the length of the right padding
        # taking into consideration any emoji or not
        # current longest line - minus current line text = space left
        # 
        local EXTRA_PR=$(( ${!TMP_LONGEST_LINE_LENGTH} - $LENGTH_OF_CURRENT_LINE ))
        local HALF_EXTRA_PR=$(( $EXTRA_PR / 2 ))
        local REMAINDER_EXTRA_PR=$(( $EXTRA_PR - $HALF_EXTRA_PR ))
        # printf "LONGEST LINE: ${!TMP_LONGEST_LINE_LENGTH} \n"
        # printf "PADDING RIGHT: ${EXTRA_PR} \n"


        # LINE-PADDING 
        #
        # text░░░░░░░
        # textline░░░
        # abc░░░░░░░░
        #
        # Create the correct actual padding needed for
        # each line to be consistent width.
        #
        local LINE_EXTRA_PR=$(repeat_characters " " $EXTRA_PR )
        local HALF_EXTRA_PR=$(repeat_characters " " $HALF_EXTRA_PR )
        local REMAINDER_EXTRA_PR=$(repeat_characters " " $REMAINDER_EXTRA_PR )
        # printf "EXTRA PADDING RIGHT: |${LINE_EXTRA_PR}| \n"


        # X-PADDING
        #
        # ▓▓▒▒text░░░░░░░▒▒▓▓
        # ▓▓▒▒textline░░░▒▒▓▓
        # ▓▓▒▒abc░░░░░░░░▒▒▓▓
        #
        # INDIRECTION NOT SETUP CORRECTLY!
        # not using PREFIX
        #
        # Create the [X, Right and Lef] horizontal padding 
        # printf "BOX_PR: |${BOX_PR}|\n"
        # printf "BOX_PL: |${BOX_PL}|\n"
        # printf "BOX_PX: |${BOX_PX}|\n"
        PR_SPACES=$(repeat_characters " " "${BOX_PR}")
        PL_SPACES=$(repeat_characters " " "${BOX_PL}")
        PX_SPACES=$(repeat_characters " " "${BOX_PX}")

        # FULL LINE
        #
        # │░textbox here 123 🚀░░│
        # 
        # Create the full text line with all padding
        # required and edges.
        #
        TEXT_LINES="${TEXT_LINES}${BOX_BG_COLOUR}"
        TEXT_LINES="${TEXT_LINES}${BOX_EDGE_L}"
        TEXT_LINES="${TEXT_LINES}${PX_SPACES}"
        TEXT_LINES="${TEXT_LINES}${PL_SPACES}"
            TEXT_LINES="${TEXT_LINES}${RESET_TEXT}"
            TEXT_LINES="${TEXT_LINES}${BOX_TEXT_COLOUR}"

            if [[ "$BOX_ALIGN" == "RIGHT" ]];then
                TEXT_LINES="${TEXT_LINES}${LINE_EXTRA_PR}"
            fi

            if [[ "$BOX_ALIGN" == "CENTER" ]];then
                TEXT_LINES="${TEXT_LINES}${HALF_EXTRA_PR}"
            fi

            TEXT_LINES="${TEXT_LINES}${CURRENT_LINE}"
            
            if [[ "$BOX_ALIGN" == "LEFT" ]];then
                TEXT_LINES="${TEXT_LINES}${LINE_EXTRA_PR}"
            fi

            if [[ "$BOX_ALIGN" == "CENTER" ]];then
                TEXT_LINES="${TEXT_LINES}${REMAINDER_EXTRA_PR}"
            fi

            TEXT_LINES="${TEXT_LINES}${RESET_TEXT}"
        TEXT_LINES="${TEXT_LINES}${BOX_BORDER_COLOUR}"
        TEXT_LINES="${TEXT_LINES}${PR_SPACES}"
        TEXT_LINES="${TEXT_LINES}${PX_SPACES}"
        TEXT_LINES="${TEXT_LINES}${BOX_EDGE_R}"
        TEXT_LINES="${TEXT_LINES}${RESET_BG}"
        TEXT_LINES="${TEXT_LINES}\n"
        
        # printf "${TEXT_LINES}"
    done

}