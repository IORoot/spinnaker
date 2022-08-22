#!/bin/bash

# BACKGROUND TEXT
# \e[38;5;COLOURNUMBERm
#
# for code in {0..255}; do echo -e "\e[48;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"; done

printf "\n8-Bit Text Variations\n\n"
text_variations() {

    TEXTPREFIX='\e[38;5;'
    BG='\e[48;5;'
    TEXTSUFFIX='m'

    DIM='\e[2m'
    DIM_OFF='\e[22m'

    ITALIC='\e[3m'
    ITALIC_OFF='\e[23m'

    UNDERLINE='\e[4m'
    UNDERLINE_OFF='\e[24m'

    INVERT='\e[7m'
    INVERT_OFF='\e[27m'

    STRIKED='\e[9m'
    STRIKED_OFF='\e[29m'

    PINK_500='207'
    GREEN_500='48'
    YELLOW_500='227'

    TEXT_PINK_500="${TEXTPREFIX}${PINK_500}${TEXTSUFFIX}"
    TEXT_GREEN_500="${TEXTPREFIX}${GREEN_500}${TEXTSUFFIX}"
    TEXT_YELLOW_500="${TEXTPREFIX}${YELLOW_500}${TEXTSUFFIX}"

    # 24-Bit colour RED
    # \e[38;2;RED;GREEN;BLUEm
    TEXT_RGB_500='\e[38;2;94;234;212m'

}

# run function
text_variations

# printf "${TEXT_GREEN_500}TEXT\n"
# printf "${UNDERLINE}${TEXT_GREEN_500}UNDERLINED \n${UNDERLINE_OFF}"
# printf "${DIM}${TEXT_PINK_500}DIM \n${DIM_OFF}"
# printf "${INVERT}${TEXT_YELLOW_500}INVERT \n${INVERT_OFF}"
# printf "${STRIKED}${TEXT_GREEN_500}STRIKED \n${STRIKED_OFF}"
# printf "${ITALIC}${TEXT_PINK_500}ITALIC \n${ITALIC_OFF}"
# printf "${RGB}${TEXT_RGB_500}RGB-COLOUR\n${RGB_OFF}"
# printf "${RESET}RESET\n"
