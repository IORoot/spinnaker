#!/bin/bash

# Repeat a Character
# $1 = number of times
# $2 = character to repeat
repeat_character(){
    for (( i = 0; i < $1; ++i )); do echo -n "$2"; done
}


title_box()
{   

    CLASSES=$1
    TEXT_STRING=$2

    PADDING_PX=0
    PADDING_PY=0

    PADDING_PT=0
    PADDING_PR=0
    PADDING_PB=0
    PADDING_PL=0
    
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
        
        # Echo out variable name
        # VARIABLENAME=COLOUR_$PARAMETER
        # printf "${!VARIABLENAME} $VARIABLENAME\n"
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
    WIDTH=$(( ($PADDING_PL) + ($PADDING_PX) + ${STRING_LENGTH} + ($PADDING_PX) + ($PADDING_PR) ))

    # Define the icons to use to draw the box
    ICON_CORNER_TL="${ICON_TL}"
    ICON_CORNER_TR="${ICON_TR}"
    ICON_CORNER_BR="${ICON_BR}"
    ICON_CORNER_BL="${ICON_BL}"
    ICON_HORIZONTAL="${ICON_FH}"
    ICON_VERTICAL="${ICON_FV}"

    # Create the horizontal top and bottom bar
    HORIZONTAL_BAR=$(repeat_character ${WIDTH} ${ICON_HORIZONTAL})

    # Create the horizontal padding
    PR_PADDING=$(repeat_character $PADDING_PR " ")
    PL_PADDING=$(repeat_character $PADDING_PL " ")
    PX_PADDING=$(repeat_character $PADDING_PX " ")

    # Create an empty space for vertical padding
    VERTICAL_PADDING=$(repeat_character ${WIDTH} " ")

    # Create the vertical spacer padding line
    VERTICAL_PADDING_LINE="${ICON_VERTICAL}${VERTICAL_PADDING}${ICON_VERTICAL}\n"
    


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






    # Create the output box
    BOX=""

    # Top line
    BOX="${BOX}${COLOUR_BORDER}"
    BOX="${BOX}${ICON_CORNER_TL}"
    BOX="${BOX}${HORIZONTAL_BAR}"
    BOX="${BOX}${ICON_CORNER_TR}"
    BOX="${BOX}\n"

    # Vertical padding lines
    BOX="${BOX}${PT_LINE}"
    BOX="${BOX}${PY_LINE}"

    # Text Line
    BOX="${BOX}${ICON_VERTICAL}"
    BOX="${BOX}${PX_PADDING}"
    BOX="${BOX}${PL_PADDING}"
    BOX="${BOX}${COLOUR_TEXT}"
    BOX="${BOX}${TEXT_STRING}"
    BOX="${BOX}${COLOUR_BORDER}"
    BOX="${BOX}${PR_PADDING}"
    BOX="${BOX}${PX_PADDING}"
    BOX="${BOX}${ICON_VERTICAL}"
    BOX="${BOX}\n"

    # Vertical padding lines
    BOX="${BOX}${PY_LINE}"
    BOX="${BOX}${PB_LINE}"

    # Bottom line
    BOX="${BOX}${ICON_CORNER_BL}"
    BOX="${BOX}${HORIZONTAL_BAR}"
    BOX="${BOX}${ICON_CORNER_BR}"

    # Print the output box
    printf "${BOX}\n"

}


title_box "$@"