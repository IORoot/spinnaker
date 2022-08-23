#!/bin/bash

# Repeat a Character
# $1 = number of times
# $2 = character to repeat
repeat_character(){
    for (( i = 0; i < $1; ++i )); do echo -n "$2"; done
}

# Create a box with various qualities.
# - Font colour
# - Background colour
# - border colour
# - border style
# - padding X,Y,Top,Right,Bottom,Left
box()
{   

    CLASSES=$1
    TEXT_STRING=$2

    PADDING_PX=0
    PADDING_PY=0

    PADDING_PT=0
    PADDING_PR=0
    PADDING_PB=0
    PADDING_PL=0
    
    # Define the icons to use to draw the box
    EDGE_TL="${ICON_TL}"
    EDGE_T="${ICON_FH}"
    EDGE_TR="${ICON_TR}"
    EDGE_R="${ICON_FV}"
    EDGE_BR="${ICON_BR}"
    EDGE_B="${ICON_FH}"
    EDGE_BL="${ICON_BL}"
    EDGE_L="${ICON_FV}"


    # Create an array of text lines 
    TEXT_STRING=${TEXT_STRING//'\n'/$'yyyy'}
    IFS=$'yyyy' read -r -a ARRAY_OF_LINES <<< "$TEXT_STRING"

    # Find the longest line in array
    LONGEST_LINE=0
    LENGTH_OF_CURRENT_LINE=0
    ICON_PADDING=0
    for CURRENT_LINE in "${ARRAY_OF_LINES[@]}"; do

        LENGTH_OF_CURRENT_LINE=${#CURRENT_LINE}

        if [[ $CURRENT_LINE = *[![:ascii:]]* ]]; then
            ICON_PADDING=1
            LENGTH_OF_CURRENT_LINE=$(( $LENGTH_OF_CURRENT_LINE + $ICON_PADDING ))
        fi

        # If the length of line is biggest, set.
        if [ $LENGTH_OF_CURRENT_LINE -gt $LONGEST_LINE ]; then
            LONGEST_LINE=$LENGTH_OF_CURRENT_LINE
        fi

    done



    # class list to be parsed.
    # loop through each class name and create a CLASS variable
    # set inter-field separator (IFS) to a space and loop
    export IFS=" "
    for CLASS in $CLASSES; do

        # Split by underscores and assign each part to a variable
        IFS="_" read PARAMETER PRIMARY SECONDARY <<< "$CLASS"
        # printf "$PARAMETER : $COLOUR : $SATURATION\n"

        # create new variable TEXT_COLOUR, BG_COLOUR, BORDER_COLOUR, etc...
        # And set it to the full string.
        if [[ $PARAMETER == 'TEXT' ]] || [[ $PARAMETER == 'BG' ]] || [[ $PARAMETER == 'BORDER' ]]; then
            declare COLOUR_$PARAMETER=${!CLASS}
        fi

        if [[ $PARAMETER == PX* ]] || [[ $PARAMETER == PY* ]] || [[ $PARAMETER == PT* ]] || [[ $PARAMETER == PR* ]] || [[ $PARAMETER == PB* ]] || [[ $PARAMETER == PL* ]]; then
            declare PADDING_$PARAMETER=${!CLASS}
        fi 
        
        if [[ $PARAMETER == EDGE* ]] && [[ $SECONDARY == "" ]] ; then
            varname="${PARAMETER}_${PRIMARY}_TL"; declare EDGE_TL=${!varname}
            varname="${PARAMETER}_${PRIMARY}_T";  declare EDGE_T=${!varname}
            varname="${PARAMETER}_${PRIMARY}_TR"; declare EDGE_TR=${!varname}
            varname="${PARAMETER}_${PRIMARY}_R";  declare EDGE_R=${!varname}
            varname="${PARAMETER}_${PRIMARY}_BR"; declare EDGE_BR=${!varname}
            varname="${PARAMETER}_${PRIMARY}_B";  declare EDGE_B=${!varname}
            varname="${PARAMETER}_${PRIMARY}_BL"; declare EDGE_BL=${!varname}
            varname="${PARAMETER}_${PRIMARY}_L";  declare EDGE_L=${!varname}
        fi 

        if [[ $PARAMETER == EDGE* ]] && ! [[ $SECONDARY == "" ]] ; then
            varname="${CLASS}"
            declare EDGE_${SECONDARY}=${!varname}
        fi

        # VARIABLENAME=COLOUR_$PARAMETER && printf "${!VARIABLENAME} $VARIABLENAME\n"
    done


    # HORIZONTAL PADDING

    # Generate the horizontal padding lines
    if ! [ $PADDING_PX -eq "0" ]; then
        PX_SPACING=$(repeat_character $PADDING_PX " ")
    fi

    # Generate the TOP padding lines if its set
    if ! [ $PADDING_PR -eq "0" ]; then
        PR_SPACING=$(repeat_character $PADDING_PR " ")
    fi

    # Generate the BOTTOM padding lines if its set
    if ! [ $PADDING_PL -eq "0" ]; then
        PL_SPACING=$(repeat_character $PADDING_PL " ")
    fi


    # Figure out lengths and add the padding x2 (on each side)
    STRING_LENGTH=${#TEXT_STRING}
    WIDTH=$(( $PADDING_PL + $PADDING_PX + ${LONGEST_LINE} + $PADDING_PX + $PADDING_PR ))


    # Create the horizontal top and bottom bar
    EDGE_T=$(repeat_character ${WIDTH} ${EDGE_T})
    EDGE_B=$(repeat_character ${WIDTH} ${EDGE_B})

    # Create the horizontal padding
    PR_PADDING=$(repeat_character $PADDING_PR " ")
    PL_PADDING=$(repeat_character $PADDING_PL " ")
    PX_PADDING=$(repeat_character $PADDING_PX " ")

    # Create an empty space for vertical padding
    VERTICAL_PADDING=$(repeat_character ${WIDTH} " ")

    # Create the vertical spacer padding line
    VERTICAL_PADDING_LINE="${COLOUR_BG}${EDGE_L}${VERTICAL_PADDING}${EDGE_R}${RESET_BG}\n"
    


    # VERTICAL PADDING
    
    # Generate the vertical padding lines
    if ! [ $PADDING_PY -eq "0" ]; then
        PY_LINE=$(repeat_character $PADDING_PY "${VERTICAL_PADDING_LINE}")
    fi

    # Generate the TOP padding lines if its set
    if ! [ $PADDING_PT -eq "0" ]; then
        PT_LINE=$(repeat_character $PADDING_PT "${VERTICAL_PADDING_LINE}")
    fi

    # Generate the BOTTOM padding lines if its set
    if ! [ $PADDING_PB -eq "0" ]; then
        PB_LINE=$(repeat_character $PADDING_PB "${VERTICAL_PADDING_LINE}")
    fi





    # Generate a text-line for each line in array
    TEXT_LINE=""

    # Loop through Array to add extra padding
    for LINE in "${ARRAY_OF_LINES[@]}"; do

        if [[ -z $LINE ]]; then continue; fi

        # Extra line padding
        LINE_LENGTH=${#LINE}
        EXTRA_PR_LENGTH=$(( $LONGEST_LINE - $LINE_LENGTH - $ICON_PADDING ))
        EXTRA_PR=$(repeat_character $EXTRA_PR_LENGTH " ")


        # printf "$LINE\n"
        TEXT_LINE="${TEXT_LINE}${COLOUR_BG}"
        TEXT_LINE="${TEXT_LINE}${EDGE_L}"
        TEXT_LINE="${TEXT_LINE}${PX_PADDING}"
        TEXT_LINE="${TEXT_LINE}${PL_PADDING}"
            TEXT_LINE="${TEXT_LINE}${RESET_TEXT}"
            TEXT_LINE="${TEXT_LINE}${COLOUR_TEXT}"
            TEXT_LINE="${TEXT_LINE}${LINE}"
            TEXT_LINE="${TEXT_LINE}${EXTRA_PR}"
            TEXT_LINE="${TEXT_LINE}${RESET_TEXT}"
        TEXT_LINE="${TEXT_LINE}${COLOUR_BORDER}"
        TEXT_LINE="${TEXT_LINE}${PR_PADDING}"
        TEXT_LINE="${TEXT_LINE}${PX_PADDING}"
        TEXT_LINE="${TEXT_LINE}${EDGE_R}"
        TEXT_LINE="${TEXT_LINE}${RESET_BG}"
        TEXT_LINE="${TEXT_LINE}\n"
        
    done


    # Create the output box
    BOX=""

    # Set background colour
    BOX="${BOX}${COLOUR_BG}"

    # Top line
    BOX="${BOX}${COLOUR_BORDER}"
    BOX="${BOX}${EDGE_TL}"
    BOX="${BOX}${EDGE_T}"
    BOX="${BOX}${EDGE_TR}"
    BOX="${BOX}\n"

    # Vertical padding lines
    BOX="${BOX}${PT_LINE}"
    BOX="${BOX}${PY_LINE}"

    # Text Line
    BOX="${BOX}${TEXT_LINE}"

    # Vertical padding lines
    BOX="${BOX}${PY_LINE}"
    BOX="${BOX}${PB_LINE}"

    # Bottom line
    BOX="${BOX}${COLOUR_BG}"
    BOX="${BOX}${EDGE_BL}"
    BOX="${BOX}${EDGE_B}"
    BOX="${BOX}${EDGE_BR}"
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