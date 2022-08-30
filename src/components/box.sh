#!/bin/bash

# ┌─────────────────────────────────────┐
# │                                     │
# │             Line Count              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/line_count.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │         Longest Line Count          │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/longest_text_line.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │          Repeat characters          │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/repeat_characters.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │           Redefine Widths           │
# │   (For any terminal size changes)   │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_DEFINE_FOLDER/define_widths.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │          Redefine Heights           │
# │   (For any terminal size changes)   │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_DEFINE_FOLDER/define_heights.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │             Create Box              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/box/create_box.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │             Text Lines              │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/box/text_lines.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │          Vertical Padding           │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/box/vertical_padding.sh


# ┌─────────────────────────────────────┐
# │                                     │
# │            Parse Classes            │
# │                                     │
# └─────────────────────────────────────┘
source $SPINNAKER_TOOLS_FOLDER/utils/parse_classes_func.sh


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
