#!/bin/bash

# ┌─────────────────────────────────────┐
# │                                     │
# │             Line Count              │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/utils/line_count.sh
line_count(){

    TEXT_STRING=$1

    # replace any '\n' (newlines) with ‰
    local STRING_ARRAY=${TEXT_STRING//'\n'/$'‰'}
    local STRING_ARRAY=${STRING_ARRAY//$'\n'/$'‰'}
    
    # split by ‰ and make an array of each line
    IFS=$'‰' read -r -a ARRAY_OF_LINES <<< "$STRING_ARRAY"

    # Number of lines in array
    LINE_COUNT=${#ARRAY_OF_LINES[@]}

    echo $LINE_COUNT
}


# ┌─────────────────────────────────────┐
# │                                     │
# │         Longest Line Count          │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/utils/longest_text_line.sh


# For a multi-line string (with possible emoji)
# Calculate the length of the longest line.
longest_line_length(){

    TEXT_STRING=$1

    # replace any '\n' (newlines) with ‰
    STRING_ARRAY=${TEXT_STRING//'\n'/$'‰'}
    STRING_ARRAY=${STRING_ARRAY//$'\n'/$'‰'}

    # split by ‰ and make an array of each line
    IFS=$'‰' read -r -a ARRAY_OF_LINES <<< "$STRING_ARRAY"

    # reset LONGEST_LINE_LENGTH
    LONGEST_LINE_LENGTH=0

    # Find the longest line in array
    # by iterating through it and checking if its longer
    # than the previous longest line.
    for CURRENT_LINE in "${ARRAY_OF_LINES[@]}"; do

        # Count line length
        LENGTH_OF_CURRENT_LINE=${#CURRENT_LINE}

        # If there is a non-ascii character, Increase the line by + 1 for each
        if [[ $CURRENT_LINE = *[![:ascii:]]* ]]; then
        
            # Substitute all emoji for another weird symbol
            WEIRD_LINE="${CURRENT_LINE//[^[:ascii:]]/∑}"
            
            # Normal string without weird characters.
            NO_EMOJI_LINE=${WEIRD_LINE//∑/}

            # Length of normal string without weird characters
            NO_EMOJI_LINE=${#NO_EMOJI_LINE}
            
            # Difference between full line and line without emoji.
            LINE_EMOJI_COUNT=$(( $LENGTH_OF_CURRENT_LINE - $NO_EMOJI_LINE  ))

            # Each emoji takes 2-characters, so double the number of characters
            # for each emoji present.
            LENGTH_OF_CURRENT_LINE=$(( $LENGTH_OF_CURRENT_LINE + $LINE_EMOJI_COUNT ))
        fi

        # If the length of line is biggest, set it.
        if [[ $LENGTH_OF_CURRENT_LINE -gt $LONGEST_LINE_LENGTH ]]; then
            LONGEST_LINE_LENGTH=$LENGTH_OF_CURRENT_LINE
        fi

        # printf "length: $LENGTH_OF_CURRENT_LINE line: $CURRENT_LINE\n"
    done

    # Override with Width if set.

    if ! [ -z $BOX_W ]; then
        LONGEST_LINE_LENGTH=$(( $BOX_W - 3 ))
    fi

    echo $LONGEST_LINE_LENGTH

}


# ┌─────────────────────────────────────┐
# │                                     │
# │          Repeat characters          │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/utils/repeat_characters.sh


# Repeat a Character
# $1 = character to repeat
# $2 = number of times
repeat_characters(){
    for (( i = 0; i < $2; ++i )); do printf "$1"; done
}


# ┌─────────────────────────────────────┐
# │                                     │
# │           Redefine Widths           │
# │   (For any terminal size changes)   │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_DEFINE_FOLDER/define_widths.sh


define_widths(){

    export declare W_FULL=$(tput cols)

    export declare W_1_2=$((${W_FULL} / 2))

    export declare W_1_3=$((${W_FULL} / 3))
    export declare W_2_3=$(( (${W_FULL} / 3) * 2 ))

    export declare W_1_4=$(( (${W_FULL} / 4) ))
    export declare W_2_4=$(( (${W_FULL} / 4) * 2 ))
    export declare W_3_4=$(( (${W_FULL} / 4) * 3 ))

    export declare W_1_5=$((${W_FULL} / 5))
    export declare W_2_5=$(( (${W_FULL} / 5) * 2 ))
    export declare W_3_5=$(( (${W_FULL} / 5) * 3 ))
    export declare W_4_5=$(( (${W_FULL} / 5) * 4 ))

    export declare W_1_6=$((${W_FULL} / 6))
    export declare W_2_6=$(( (${W_FULL} / 6) * 2 ))
    export declare W_3_6=$(( (${W_FULL} / 6) * 3 ))
    export declare W_4_6=$(( (${W_FULL} / 6) * 4 ))
    export declare W_5_6=$(( (${W_FULL} / 6) * 5 ))

}


# ┌─────────────────────────────────────┐
# │                                     │
# │          Redefine Heights           │
# │   (For any terminal size changes)   │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_DEFINE_FOLDER/define_heights.sh


define_heights(){

    export declare H_FULL=$(tput lines)

    export declare H_1_2=$((${H_FULL} / 2))

    export declare H_1_3=$((${H_FULL} / 3))
    export declare H_2_3=$(( (${H_FULL} / 3) * 2 ))

    export declare H_1_4=$(( (${H_FULL} / 4) ))
    export declare H_2_4=$(( (${H_FULL} / 4) * 2 ))
    export declare H_3_4=$(( (${H_FULL} / 4) * 3 ))

    export declare H_1_5=$((${H_FULL} / 5))
    export declare H_2_5=$(( (${H_FULL} / 5) * 2 ))
    export declare H_3_5=$(( (${H_FULL} / 5) * 3 ))
    export declare H_4_5=$(( (${H_FULL} / 5) * 4 ))

    export declare H_1_6=$((${H_FULL} / 6))
    export declare H_2_6=$(( (${H_FULL} / 6) * 2 ))
    export declare H_3_6=$(( (${H_FULL} / 6) * 3 ))
    export declare H_4_6=$(( (${H_FULL} / 6) * 4 ))
    export declare H_5_6=$(( (${H_FULL} / 6) * 5 ))

}


# ┌─────────────────────────────────────┐
# │                                     │
# │             Create Box              │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/box/create_box.sh


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


# ┌─────────────────────────────────────┐
# │                                     │
# │             Text Lines              │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/box/text_lines.sh


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


# ┌─────────────────────────────────────┐
# │                                     │
# │          Vertical Padding           │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/box/vertical_padding.sh


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


# ┌─────────────────────────────────────┐
# │                                     │
# │            Parse Classes            │
# │                                     │
# └─────────────────────────────────────┘
#source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes_func.sh



# Parses a class list string
# Returns an array of keys and values
# 
# e.g. 
# takes two parameters:
# 1. A prefix name "BOX"
# 2. A single string "TEXT_RED_400 BG_EMERALD_100 BORDER_BLUE_800 PX_4 PT_4 EDGE_FINE EDGE_DUAL_B EDGE_DUAL_L EDGE_DUAL_BL"
# 
# The function then sets the global variables:
# BOX_TEXT_COLOUR=TEXT_RED_400
# BOX_BG_COLOUR=BG_EMERALD_100
# BOX_BORDER_COLOUR=BORDER_BLUE_800
# BOX_PX=PX_4
# BOX_PT=PT_4
# BOX_EDGE=EDGE_FINE
# BOX_EDGE_B=EDGE_DUAL_B
# BOX_EDGE_L=EDGE_DUAL_L
# BOX_EDGE_BL=EDGE_DUAL_BL
#
# These are then used within the original function to override any defaults.
#

function parse_classes()
{
    # Name to prefix all variable names with
    PREFIX=$1


    # String of class names
    CLASSES=$2
    # set inter-field separator (IFS) to a space and loop
    # through each class name and create a CLASS variable
    # The class will be something like "TEXT_GREEN_100"
    export IFS=" "
    for CLASS in $CLASSES; do

        # Split by underscores and assign each part to a variable
        IFS="_" read PARAMETER PRIMARY SECONDARY <<< "$CLASS"

        # ╭──────────────────────────╮
        # │                          │
        # │        🎨 COLOURS        │
        # │                          │
        # ╰──────────────────────────╯
        # create new variable TEXT_COLOUR, BG_COLOUR, BORDER_COLOUR, etc...
        if  [[ $PARAMETER == 'TEXT' ]] || 
            [[ $PARAMETER == 'BG' ]] || 
            [[ $PARAMETER == 'BORDER' ]]; then

            export declare "${PREFIX}_${PARAMETER}_COLOUR"=${!CLASS}
        fi


        # ╭──────────────────────────╮
        # │                          │
        # │        ⬛ PADDING        │
        # │                          │
        # ╰──────────────────────────╯
        if  [[ $PARAMETER == PX* ]] || 
            [[ $PARAMETER == PY* ]] || 
            [[ $PARAMETER == PT* ]] || 
            [[ $PARAMETER == PR* ]] || 
            [[ $PARAMETER == PB* ]] || 
            [[ $PARAMETER == PL* ]]; then

            export declare "${PREFIX}_$PARAMETER"=${!CLASS}
        fi 
        

        # ╭───────────────────────╮
        # │                       │
        # │        🚀 EDGE        │
        # │                       │
        # ╰───────────────────────╯
        # If this is a "EDGE_DUAL" or "EDGE_FINE", it doesn't have $SECONDARY set.
        # So set all or the edges to the same thickness.
        if  [[ $PARAMETER == EDGE* ]] && [[ $SECONDARY == "" ]] ; then
            VAR="${PARAMETER}_${PRIMARY}_TL"; export declare "${PREFIX}_${PARAMETER}_TL"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_T";  export declare "${PREFIX}_${PARAMETER}_T"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_TR"; export declare "${PREFIX}_${PARAMETER}_TR"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_R";  export declare "${PREFIX}_${PARAMETER}_R"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_BR"; export declare "${PREFIX}_${PARAMETER}_BR"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_B";  export declare "${PREFIX}_${PARAMETER}_B"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_BL"; export declare "${PREFIX}_${PARAMETER}_BL"=${!VAR}
            VAR="${PARAMETER}_${PRIMARY}_L";  export declare "${PREFIX}_${PARAMETER}_L"=${!VAR}
        fi 

        # If it DOES have $SECONDARY set, it'll be something like "EDGE_WIDE_B"
        # Define the variable name to equal the class with a prefix. "BOX_EDGE_FINE_TL"
        if [[ $PARAMETER == EDGE* ]] && ! [[ $SECONDARY == "" ]] ; then
            VAR="${CLASS}"; export declare "${PREFIX}_${PARAMETER}_${SECONDARY}"=${!VAR}
        fi

        # ╭──────────────────────────╮
        # │                          │
        # │         → WIDTHS         │
        # │         ↑ HEIGHTS        │
        # │                          │
        # ╰──────────────────────────╯
        # create new variable W_, etc...
        if  [[ $PARAMETER == 'W' ]]; then
            export declare "${PREFIX}_${PARAMETER}"=${!CLASS}
        fi    
        
        if  [[ $PARAMETER == 'H' ]]; then
            export declare "${PREFIX}_${PARAMETER}"=${!CLASS}
        fi

        # ╭──────────────────────────╮
        # │                          │
        # │        TEXT ALIGN        │
        # │                          │
        # ╰──────────────────────────╯
        # create new variable TEXT_COLOUR, BG_COLOUR, BORDER_COLOUR, etc...
        if  [[ $PARAMETER == 'ALIGN' ]]; then
            export declare "${PREFIX}_${PARAMETER}"=${!CLASS}
        fi

    done
}


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

    # Width & Height
    declare "${PREFIX}_W"=""; local TMP_W="${PREFIX}_W"
    declare "${PREFIX}_H"=""; local TMP_H="${PREFIX}_H"

    # Multi-height Vertical Lines
    declare MULTI_PY_LINES=""
    declare MULTI_PT_LINES=""
    declare MULTI_PB_LINES=""

    # Text Align
    declare "${PREFIX}_ALIGN"="LEFT"

    # Number of Text Lines
    declare LINE_COUNT=$(line_count "${TEXT_STRING}")
    # echo "LINE_COUNT:$LINE_COUNT"
    
    # OVERRIDES
    #
    # Source and run the parse_classes script.
    # This will override any default variables
    # by setting them to supplied user values.
    #
    # @return $PREFIX_VARIABLE
    # source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes.sh "${PREFIX}" "${CLASSES}"
    parse_classes "${PREFIX}" "${CLASSES}"


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


    # HORIZONTAL BARS
    #
    # Create the horizontal top and bottom bar
    # ───────────────────── ─────────────────────
    declare "${PREFIX}_EDGE_T"=$(repeat_characters ${!TMP_EDGE_T} ${!TMP_WIDTH})
    declare "${PREFIX}_EDGE_B"=$(repeat_characters ${!TMP_EDGE_B} ${!TMP_WIDTH})


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


# Redefine heights / widths incase terminal has changed size.
define_heights
define_widths

if [ "$#" -eq 1 ]; then
    box "" "$@"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    printf "${TEXT_RED_500}Illegal number of parameters"
    printf "${TEXT_GREEN_500}usage: ${TEXT_GRAY_200}$0 ${TEXT_SKY_500}%s %s" '["classes"]' '"String"'
    exit 1
fi

box "$@"
