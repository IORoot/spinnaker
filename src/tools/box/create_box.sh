#!/bin/bash

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