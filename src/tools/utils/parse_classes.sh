#!/bin/bash


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





    # Example way to print out a variable
    # DYNAMIC_VARIABLE_NAME="${PREFIX}_${CLASS}"
    # printf "${DYNAMIC_VARIABLE_NAME} VALUE: ${!DYNAMIC_VARIABLE_NAME} \n"
    # DYNAMIC_VARIABLE_NAME="${PREFIX}_${PARAMETER}_COLOUR"
    # printf "${DYNAMIC_VARIABLE_NAME} COLOUR: ${!DYNAMIC_VARIABLE_NAME} colour ${RESET_ALL}\n"


done

