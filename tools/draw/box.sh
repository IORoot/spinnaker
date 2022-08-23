#!/bin/bash

# Repeat a Character
# $1 = number of times
# $2 = character to repeat
repeat_character(){
    for (( i = 0; i < $1; ++i )); do echo -n "$2"; done
}


# For a multi-line string (with possible emoji)
# Calculate the length of the longest line.
longest_line_width(){

    TEXT_STRING=$1

    # replace any '\n' (newlines) with ‰
    STRING_ARRAY=${TEXT_STRING//'\n'/$'‰'}

    # split by ‰ and make an array of each line
    IFS=$'‰' read -r -a ARRAY_OF_LINES <<< "$STRING_ARRAY"

    # Find the longest line in array
    # by iterating through it and checking if its longer
    # than the previous longest line.
    BOX_LONGEST_LINE=0
    BOX_EMOJI_PADDING=0
    
    for CURRENT_LINE in "${ARRAY_OF_LINES[@]}"; do

        # Count line length
        LENGTH_OF_CURRENT_LINE=${#CURRENT_LINE}

        # If there is a non-ascii character, Increase the line by + 1
        # And set BOX_EMOJI_PADDING to +1
        if [[ $CURRENT_LINE = *[![:ascii:]]* ]]; then
            BOX_EMOJI_PADDING=1
            LENGTH_OF_CURRENT_LINE=$(( $LENGTH_OF_CURRENT_LINE + $BOX_EMOJI_PADDING ))
        fi

        # echo "length: $LENGTH_OF_CURRENT_LINE index: $CURRENT_LINE"

        # Check for NON-ASCII characters and increase
        # remove padding -1 for each because emoji are
        # 2-character width icons.
        # if [[ $CURRENT_LINE = *[![:ascii:]]* ]]; then
        #     ZZZZ_ONLY="${CURRENT_LINE//[^[:ascii:]]/ZZZZZ}"
        #     INSTANCES=${#ZZZZ_ONLY}
            
        #     LINE_EMOJI_COUNT=${ZZZZ_ONLY//ZZZZZ/}
        #     LINE_EMOJI_COUNT=${#LINE_EMOJI_COUNT}
        #     LINE_EMOJI_COUNT=$(( ( $INSTANCES - $LINE_EMOJI_COUNT ) / 5 ))

        #     # LINE_EMOJI_PADDING=$LINE_EMOJI_COUNT
        #     # printf "LINE_EMOJI_COUNT=$BOX_EMOJI_COUNT \n"
        #     # printf "LINE_EMOJI_PADDING=$LINE_EMOJI_PADDING \n"

        #     LENGTH_OF_CURRENT_LINE=$(( $LENGTH_OF_CURRENT_LINE + $LINE_EMOJI_COUNT ))
        # fi

        # If the length of line is biggest, set it.
        if [ $LENGTH_OF_CURRENT_LINE -gt $BOX_LONGEST_LINE ]; then
            BOX_LONGEST_LINE=$LENGTH_OF_CURRENT_LINE
        fi

    done

}



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

    # Default Padding Sizes
    declare "${PREFIX}_PX"=0
    declare "${PREFIX}_PY"=0

    declare "${PREFIX}_PT"=0
    declare "${PREFIX}_PR"=0
    declare "${PREFIX}_PB"=0
    declare "${PREFIX}_PL"=0
    
    # Default edge icons
    declare "${PREFIX}_EDGE_TL"="${ICON_TL}"
    declare "${PREFIX}_EDGE_T"="${ICON_FH}"
    declare "${PREFIX}_EDGE_TR"="${ICON_TR}"
    declare "${PREFIX}_EDGE_R"="${ICON_FV}"
    declare "${PREFIX}_EDGE_BR"="${ICON_BR}"
    declare "${PREFIX}_EDGE_B"="${ICON_FH}"
    declare "${PREFIX}_EDGE_BL"="${ICON_BL}"
    declare "${PREFIX}_EDGE_L"="${ICON_FV}"


    # Figure out the longest line width.
    longest_line_width "$TEXT_STRING"

    # Source and run the parse_classes script.
    # This will override any defaults by setting them
    # to specified values
    . ../utils/parse_classes.sh "${PREFIX}" "${CLASSES}"


    # Figure out the width of the box WITHOUT EDGES
    # Take the longest line (figured out above)
    # Add any padding from "PX_", "PR_" or "PL_"
    BOX_WIDTH=$(( $BOX_PL + $BOX_PX + ${BOX_LONGEST_LINE} + $BOX_PX + $BOX_PR ))

    # Create the horizontal top and bottom bar
    # ───────────────────── ─────────────────────
    BOX_EDGE_T=$(repeat_character ${BOX_WIDTH} ${BOX_EDGE_T})
    BOX_EDGE_B=$(repeat_character ${BOX_WIDTH} ${BOX_EDGE_B})

    # Create the horizontal padding
    # ░░▒▒TEXT▒▒░░░░
    BOX_PR=$(repeat_character $BOX_PR " ")
    BOX_PL=$(repeat_character $BOX_PL " ")
    BOX_PX=$(repeat_character $BOX_PX " ")

    # Create an empty space for vertical padding
    # ░░░░░░░░░░░░░░░░
    BOX_VERTICAL=$(repeat_character ${BOX_WIDTH} " ")

    # Create the vertical spacer padding line with edges
    # │░░░░░░░░░░░░░░░░│
    BOX_VERTICAL_LINE="${BOX_BG_COLOUR}${BOX_EDGE_L}${BOX_VERTICAL}${BOX_EDGE_R}${RESET_BG} \n"
    


    # VERTICAL PADDING
    # Generate the vertical padding lines
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ $BOX_PY -eq "0" ]; then
        BOX_PY_LINE=$(repeat_character $BOX_PY "${BOX_VERTICAL_LINE}")
    fi

    # Generate the TOP padding lines if its set
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ $BOX_PT -eq "0" ]; then
        BOX_PT_LINE=$(repeat_character $BOX_PT "${BOX_VERTICAL_LINE}")
    fi

    # Generate the BOTTOM padding lines if its set
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    # │░░░░░░░░░░░░░░░░│
    if ! [ $BOX_PB -eq "0" ]; then
        BOX_PB_LINE=$(repeat_character $BOX_PB "${BOX_VERTICAL_LINE}")
    fi


    # Start empty
    BOX_TEXT_LINE=""

    # Loop through Array to add extra padding
    # Generate a text-line for each line in array
    # ARRAY_OF_LINES[1] = "textline 1 🚀"
    # ARRAY_OF_LINES[2] = "text 2"
    # ARRAY_OF_LINES[3] = "text line three 🏠"
    for LINE in "${ARRAY_OF_LINES[@]}"; do

        # skip empty.
        if [[ -z $LINE ]]; then continue; fi

        # Current Line length
        # i.e. 20
        BOX_CURRENT_LINE_LENGTH=${#LINE}

        # If line contains emoji +1 for double-character
        # "textline 1 🚀" 
        if [[ $LINE = *[![:ascii:]]* ]]; then
            BOX_CURRENT_LINE_LENGTH=$(( $BOX_CURRENT_LINE_LENGTH + 1 ))
        fi

        # Set the length of the right padding
        # taking into consideration any emoji or not
        # current longest line - minus current line text = space left
        # 
        BOX_EXTRA_PR_LENGTH=$(( $BOX_LONGEST_LINE - $BOX_CURRENT_LINE_LENGTH ))

        # ░
        BOX_EXTRA_PR=$(repeat_character $BOX_EXTRA_PR_LENGTH " ")

        # Create text line
        # │░textbox here 123 🚀░░│
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_BG_COLOUR}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_EDGE_L}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_PX}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_PL}"
            BOX_TEXT_LINE="${BOX_TEXT_LINE}${RESET_TEXT}"
            BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_TEXT_COLOUR}"
            BOX_TEXT_LINE="${BOX_TEXT_LINE}${LINE}"
            BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_EXTRA_PR}"
            BOX_TEXT_LINE="${BOX_TEXT_LINE}${RESET_TEXT}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_BORDER_COLOUR}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_PR}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_PX}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${BOX_EDGE_R}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}${RESET_BG}"
        BOX_TEXT_LINE="${BOX_TEXT_LINE}\n"
        
    done


    # Create the output box
    BOX=""

    # Set background colour
    BOX="${BOX}${BOX_BG_COLOUR}"

    # Top line
    BOX="${BOX}${BOX_BORDER_COLOUR}"
    BOX="${BOX}${BOX_EDGE_TL}"
    BOX="${BOX}${BOX_EDGE_T}"
    BOX="${BOX}${BOX_EDGE_TR}"
    BOX="${BOX}\n"

    # Vertical padding lines
    BOX="${BOX}${BOX_PT_LINE}"
    BOX="${BOX}${BOX_PY_LINE}"

    # Text Line
    BOX="${BOX}${BOX_TEXT_LINE}"

    # Vertical padding lines
    BOX="${BOX}${BOX_PY_LINE}"
    BOX="${BOX}${BOX_PB_LINE}"

    # Bottom line
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