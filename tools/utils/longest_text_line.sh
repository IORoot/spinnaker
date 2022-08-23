#!/bin/bash

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