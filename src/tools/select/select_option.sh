#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/146570/arrow-key-enter-menu
# https://stackoverflow.com/questions/49531797/bash-submenu-with-arrowkeys


# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
function select_option {
    
    HEIGHT=3
    FOOTER_HEIGHT=2

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")                                                               # Escape sequence for ANSI control characters
    cursor_blink_on()  { printf "$ESC[?25h"; }                                          # Turn Cursor blink on
    cursor_blink_off() { printf "$ESC[?25l"; }                                          # Turn Cursor blink off
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }                                   # Position the Cursor: [LINE;COLUMNH (H at end.)
    
    ref_to_content()   {
        VARNAME=$1
        REFERENCE=${!VARNAME}
        echo "${REFERENCE}"
    }

    ref_to_ref_to_content()   {
        VARNAME=$1
        REFERENCE=${!VARNAME}
        OUTPUT=${!REFERENCE}
        echo "${OUTPUT}"
    }

    print_option()     {                                                                # Print Text
        TEXT=$1
        LOOP_INDEX=$2

        TITLE=$( ref_to_content "SELECT_ARRAY_TITLE_${LOOP_INDEX}" )
        TITLE_STYLE=$(ref_to_ref_to_content "SELECT_ARRAY_TITLE_STYLE_${LOOP_INDEX}")
        DESCRIPTION=$(ref_to_content "SELECT_ARRAY_DESCRIPTION_${LOOP_INDEX}")
        DESCRIPTION_STYLE=$(ref_to_ref_to_content "SELECT_ARRAY_DESCRIPTION_STYLE_${LOOP_INDEX}")

        TITLE=$(eval "printf \"${TITLE}\"")
        DESCRIPTION=$(eval "printf \"${DESCRIPTION}\"")

        OPTION_TEXT=''
        OPTION_TEXT+="  "
        OPTION_TEXT+="${TITLE_STYLE}"
        OPTION_TEXT+="${TITLE}\n"
        OPTION_TEXT+="${RESET_TEXT}"
        OPTION_TEXT+="  "
        OPTION_TEXT+="${DESCRIPTION_STYLE}"
        OPTION_TEXT+="${DESCRIPTION}"
        OPTION_TEXT+="${RESET_ALL}"

        printf "$OPTION_TEXT"; 
    }               

    invert_selected()  {                                                                # Selected Text
        TEXT=$1
        LOOP_INDEX=$2

        TITLE=$( ref_to_content "SELECT_ARRAY_TITLE_${LOOP_INDEX}" )
        TITLE_STYLE=$(ref_to_ref_to_content "SELECT_ARRAY_TITLE_STYLE_${LOOP_INDEX}")
        DESCRIPTION=$(ref_to_content "SELECT_ARRAY_DESCRIPTION_${LOOP_INDEX}")
        DESCRIPTION_STYLE=$(ref_to_ref_to_content "SELECT_ARRAY_DESCRIPTION_STYLE_${LOOP_INDEX}")
        SIDEBAR_STYLE=$(ref_to_ref_to_content "SELECT_ARRAY_SIDEBAR_STYLE_${LOOP_INDEX}")
        SIDEBAR_ICON=$(ref_to_content "$SELECT_ARRAY_SIDEBAR_ICON")

        TITLE=$(eval "printf \"${TITLE}\"")
        DESCRIPTION=$(eval "printf \"${DESCRIPTION}\"")

        OPTION_TEXT=''
        OPTION_TEXT+="${SIDEBAR_STYLE}"
        OPTION_TEXT+="${SIDEBAR_ICON} "
        OPTION_TEXT+="${TITLE_STYLE}"
        OPTION_TEXT+="${TITLE}\n"
        OPTION_TEXT+="${RESET_TEXT}"
        OPTION_TEXT+="${SIDEBAR_STYLE}"
        OPTION_TEXT+="${SIDEBAR_ICON} "
        OPTION_TEXT+="${DESCRIPTION_STYLE}"
        OPTION_TEXT+="${DESCRIPTION}"
        OPTION_TEXT+="${RESET_ALL}"

        printf "$OPTION_TEXT"; 

    }                                  

    get_terminal_height()   {                                                           # Get the number of terminal rows
        IFS=';'                                                                         # Split by ';'. 
        read -sdR -p $'\E[6n' ROW COL;                                                  # Read cursor position into two variables ROW and COL
        echo ${ROW#*[};                                                                 # Print everything before the [ bracket in ROW
    }             

    key_input()        { read -s -n3 key 2>/dev/null >&2                                # Read the key input
                            if [[ $key = $ESC[A ]]; then echo up;    fi                 # If the UP key is pressed, echo up
                            if [[ $key = $ESC[B ]]; then echo down;  fi                 # If the DOWN key is pressed, echo down
                            if [[ $key = ""     ]]; then echo enter; fi; }              # If the any key is pressed, echo enter

    footer() { printf "FOOTER" }

    # initially print empty new lines (scroll down if at bottom of screen)
    NEWLINE_COUNT=$(( ( $# * $HEIGHT ) + $FOOTER_HEIGHT ))
    for (( c=1; c<=$NEWLINE_COUNT; c++)) ; do printf "\n" ; done

    # determine current screen position for overwriting the options
    local lastrow=$(get_terminal_height)                                                # lastrow is the bottom of the terminal

    TOTAL_LINES=$(( $# * $HEIGHT ))                                                     # Number of lines = number of options * height of each

    local STARTING_ROW=$(( $lastrow - $TOTAL_LINES ))                                   # STARTING_ROW is where to start printing text..
    #echo "STARTING_ROW: $STARTING_ROW" # 14

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2                              # Catch a CTRL-C
    cursor_blink_off                                                                    # Turn any cursor blinking off.

    local selected=0                                                                    # Initialise current selected value
    while true; do                                                                      # Loop forever

            # print options by overwriting the last lines
            local LINE_OFFSET=0                                                               # Start cursor at bottom (0)

            for opt; do                                                                       # "$@" if no array provided. Loop through every option.

                cursor_to $(( $STARTING_ROW + $LINE_OFFSET )) 0                               # STARTING_ROW = bottom of terminal - height of all lines. (20 - 6) = 14. LINE_OFFSET = 0, 0 Columns.

                if [ $LINE_OFFSET -eq $(( $selected * $HEIGHT)) ]; then                       # If the current line is same as offset...
                    invert_selected "$opt" "$selected"                                        # Invert option
                else
                    INDEX=$(( $LINE_OFFSET / $HEIGHT ))
                    print_option "$opt" "$INDEX"                                              # print normal option
                fi
                (( LINE_OFFSET = LINE_OFFSET + $HEIGHT  ))                                    # +-HEIGHT to line offset
            done

            # user key control
            case `key_input` in                                                               # Wait for user input
                enter) break;;                                                                # Break loop if 'enter' is pressed

                up)    ((selected = selected - 1)); 
                    if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;                   # loop to top if passed bottom

                down)  ((selected = selected + 1));                                           # ++ if down arrow pressed,
                    if [ $selected -ge $# ]; then selected=0; fi;;                            # loop back to beginning if passed top
            esac

    done

    # # Once loop is broken, cursor position back to normal
    cursor_to $lastrow                                                                        
    printf "\n"
    cursor_blink_on

    # Return the selected value.
    return $selected
}