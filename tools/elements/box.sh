#!/bin/bash

# Import functions to use
. ../utils/longest_text_line.sh
. ../utils/repeat_characters.sh


# Create a box
#
# ╭───────────────────────────────────╮
# │                                   │ 
# │  🚀 Example box                   │
# │  With multi-line emoji support    │
# │  And awesome class-based styling  │
# │  ✅                               │
# │                                   │ 
# ╰───────────────────────────────────╯
#
# Create a box with various qualities.
# - Font colour
# - Background colour
# - border colour
# - border style
# - padding X,Y,Top,Right,Bottom,Left
box()
{ 

    # Inputs into the script
    CLASSES=$1
    TEXT_STRING=$2

    # This is used to identify this item and
    # let the parser create global variables
    # with this prefix.
    PREFIX="BOX"

    # Default Colours
    # declare dynamic variables and a variable refence to it.
    declare "${PREFIX}_TEXT_COLOUR"=""; local TMP_TEXT_COLOUR="${PREFIX}_TEXT_COLOUR"
    declare "${PREFIX}_BG_COLOUR"=""; local TMP_BG_COLOUR="${PREFIX}_BG_COLOUR"
    declare "${PREFIX}_BORDER_COLOUR"=""; local TMP_BORDER_COLOUR="${PREFIX}_BORDER_COLOUR"

    # Default Padding Sizes
    declare "${PREFIX}_PX"=0; local TMP_PX="${PREFIX}_PX"
    declare "${PREFIX}_PY"=0; local TMP_PY="${PREFIX}_PY"
    declare "${PREFIX}_PT"=0; local TMP_PT="${PREFIX}_PT"
    declare "${PREFIX}_PR"=0; local TMP_PR="${PREFIX}_PR"
    declare "${PREFIX}_PB"=0; local TMP_PB="${PREFIX}_PB"
    declare "${PREFIX}_PL"=0; local TMP_PL="${PREFIX}_PL"
    
    # Default Edge icons
    declare "${PREFIX}_EDGE_TL"="${ICON_TL}"; local TMP_EDGE_TL="${PREFIX}_EDGE_TL"
    declare "${PREFIX}_EDGE_T"="${ICON_FH}"; local TMP_EDGE_T="${PREFIX}_EDGE_T"
    declare "${PREFIX}_EDGE_TR"="${ICON_TR}"; local TMP_EDGE_TR="${PREFIX}_EDGE_TR"
    declare "${PREFIX}_EDGE_R"="${ICON_FV}"; local TMP_EDGE_R="${PREFIX}_EDGE_R"
    declare "${PREFIX}_EDGE_BR"="${ICON_BR}"; local TMP_EDGE_BR="${PREFIX}_EDGE_BR"
    declare "${PREFIX}_EDGE_B"="${ICON_FH}"; local TMP_EDGE_B="${PREFIX}_EDGE_B"
    declare "${PREFIX}_EDGE_BL"="${ICON_BL}"; local TMP_EDGE_BL="${PREFIX}_EDGE_BL"
    declare "${PREFIX}_EDGE_L"="${ICON_FV}"; local TMP_EDGE_L="${PREFIX}_EDGE_L"

    declare MULTI_PY_LINES=""
    declare MULTI_PT_LINES=""
    declare MULTI_PB_LINES=""
    
    # OVERRIDES
    #
    # Source and run the parse_classes script.
    # This will override any default variables
    # by setting them to supplied user values.
    #
    # @return $PREFIX_VARIABLE
    . ../utils/parse_classes.sh "${PREFIX}" "${CLASSES}"


    # LONGEST LINE
    #
    # Find the longest line in the text
    # using imported function longest_line_length()
    #
    # @return INT
    declare "${PREFIX}_LONGEST_LINE_LENGTH"=$(longest_line_length "${TEXT_STRING}")
    local TMP_LONGEST_LINE_LENGTH="${PREFIX}_LONGEST_LINE_LENGTH"


    # WIDTH
    #
    # Figure out the width of the box WITHOUT EDGES
    # Take the longest line (figured out above)
    # Add any padding from "PX_", "PR_" or "PL_"
    local TMP_PL="${PREFIX}_PL"
    local TMP_PX="${PREFIX}_PX"
    local TMP_PR="${PREFIX}_PR"
    declare "${PREFIX}_WIDTH"=$(( ${!TMP_PL} + ${!TMP_PX} + ${!TMP_LONGEST_LINE_LENGTH} + ${!TMP_PX} + ${!TMP_PR} ))
    local TMP_WIDTH="${PREFIX}_WIDTH"
    # printf "BOX_WIDTH=$BOX_WIDTH\n"


    # HORIZONTAL BARS
    #
    # Create the horizontal top and bottom bar
    # ───────────────────── ─────────────────────
    declare "${PREFIX}_EDGE_T"=$(repeat_characters ${!TMP_EDGE_T} ${!TMP_WIDTH})
    declare "${PREFIX}_EDGE_B"=$(repeat_characters ${!TMP_EDGE_B} ${!TMP_WIDTH})
    # printf "TMP_EDGE_T: ${!TMP_EDGE_T}\n"
    # printf "TMP_EDGE_B: ${!TMP_EDGE_B}\n"
    # printf "TMP_WIDTH: ${!TMP_WIDTH}\n"


    # Y-PADDING
    #
    # │░░░░░░░░░░░░░░░░│
    #
    # Configure all of the vertical padding variables by
    # running vertical_padding function.
    #
    # @return MULTI_PY_LINES (Y-Axis)
    # @return MULTI_PT_LINES (Top)
    # @return MULTI_PB_LINES (Bottom)
    vertical_padding


    # TEXT-LINES
    # 
    # │░textbox here 123 🚀░░│
    # │░more text░░░░░░░░░░░░│
    #
    # Create all correctly-padded text lines
    # with edges.
    # @return $TEXT_LINES
    text_lines "${TEXT_STRING}"

    # CREATE THE BOX
    #
    # Put the whole thing together.
    create_box

    # complete
    exit 0

}



# CREATE THE BOX!
#
# Puts all parts together.
create_box()
{

    # Create the output box
    BOX=""

    # Set background colour
    BOX="${BOX}${BOX_BG_COLOUR}"

    # Top line
    # ╭──────────────────╮
    BOX="${BOX}${BOX_BORDER_COLOUR}"
    BOX="${BOX}${BOX_EDGE_TL}"
    BOX="${BOX}${BOX_EDGE_T}"
    BOX="${BOX}${BOX_EDGE_TR}"
    BOX="${BOX}\n"

    # Vertical padding lines
    # │                  │
    BOX="${BOX}${MULTI_PT_LINES}"
    BOX="${BOX}${MULTI_PY_LINES}"

    # Text Line
    # │ textbox here 123 │
    BOX="${BOX}${TEXT_LINES}"

    # Vertical padding lines
    # │                  │
    BOX="${BOX}${MULTI_PY_LINES}"
    BOX="${BOX}${MULTI_PB_LINES}"

    # Bottom line
    # ╰──────────────────╯
    BOX="${BOX}${BOX_BG_COLOUR}"
    BOX="${BOX}${BOX_EDGE_BL}"
    BOX="${BOX}${BOX_EDGE_B}"
    BOX="${BOX}${BOX_EDGE_BR}"
    BOX="${BOX}${RESET_BG}"

    # Reset background colour
    BOX="${BOX}${RESET_ALL}"

    # Print the output box
    printf "${BOX}\n"

}


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

        

        # printf "PADDING LEFT = |${!TMP_PL}|\n"
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
            TEXT_LINES="${TEXT_LINES}${CURRENT_LINE}"
            TEXT_LINES="${TEXT_LINES}${LINE_EXTRA_PR}"
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



if [ "$#" -eq 1 ]; then
    box "" "$@"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    printf "${TEXT_RED_500}Illegal number of parameters\n"
    printf "${TEXT_GREEN_500}usage: ${TEXT_GRAY_200}$0 ${TEXT_SKY_500}[\"classes\"] \"String\"\n"
    exit 1
fi

box "$@"