#!/bin/bash

# Colours
GREEN='\e[38;5;48m'
PINK='\e[38;5;207m'
WHITE='\e[0m'

printf "\n"
printf "This is a reference for interesting Unicode symbols. \n"
printf "${GREEN}Use unicode website for codepoint reference: https://www.unicode.org/charts/index.html#symbols\n"
printf "\n"

# ┌─────────────────────────────────────┐
# │                                     │
# │               BLOCKS                │
# │                                     │
# └─────────────────────────────────────┘

# printf "\n${PINK}Block Elements:${RESET}\n\n"
# ./unicodeTable.sh 2580 32

# printf "\n${PINK}Symbols for Legacy Computing:${RESET}\n\n"
# ./unicodeTable.sh 1FB70 40

# printf "\n${PINK}Box Drawing:${RESET}\n\n"
# ./unicodeTable.sh 2500 128

# printf "\n${PINK}Geometric Shapes:${RESET}\n\n"
# ./unicodeTable.sh 25A0 255

# printf "\n${PINK}Miscellaneous Symbols and Arrows:${RESET}\n\n"
# ./unicodeTable.sh 2B00 256

# printf "\n${PINK}Geometric Shapes Extended:${RESET}\n\n"
# ./unicodeTable.sh 1F780 128

# ┌─────────────────────────────────────┐
# │                                     │
# │              LANGUAGES              │
# │                                     │
# └─────────────────────────────────────┘

# printf "\n${PINK}Braille:${RESET}\n\n"
# ./unicodeTable.sh 2800 256

# printf "\n${PINK}Duployan:${RESET}\n\n"
# ./unicodeTable.sh 1BC00 144

# printf "\n${PINK}General Punctuation (+ Invisible Characters):${RESET}\n\n"
# ./unicodeTable.sh 2000 112


# ┌─────────────────────────────────────┐
# │                                     │
# │                MATHS                │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Mathematical Alphanumeric Symbols:${RESET}\n\n"
# ./unicodeTable.sh 1D400 255
# ./unicodeTable.sh 1D500 255
# ./unicodeTable.sh 1D600 255
# ./unicodeTable.sh 1D700 255

# printf "\n${PINK}Aegean Numbers:${RESET}\n\n"
# ./unicodeTable.sh 10100 32


# ┌─────────────────────────────────────┐
# │                                     │
# │              TECHNICAL              │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Technical:${RESET}\n\n"
# ./unicodeTable.sh 2300 255


# ┌─────────────────────────────────────┐
# │                                     │
# │               ARROWS                │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Arrows:${RESET}\n\n"
# ./unicodeTable.sh 2190 112

# printf "\n${PINK}Supplemental Arrows-A:${RESET}\n\n"
# ./unicodeTable.sh 27F0 16

# printf "\n${PINK}Supplemental Arrows-B:${RESET}\n\n"
# ./unicodeTable.sh 2900 128


# ┌─────────────────────────────────────┐
# │                                     │
# │              SYMBOLS                │
# │                                     │
# └─────────────────────────────────────┘

# printf "\n${PINK}Misc Symbols:${RESET}\n\n"
# ./unicodeTable.sh 2B00 96

# printf "\n${PINK}Miscellaneous Symbols:${RESET}\n\n"
# ./unicodeTable.sh 2600 256


# ┌─────────────────────────────────────┐
# │                                     │
# │                EMOJI                │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Dingbats:${RESET}\n\n"
# ./unicodeTable.sh 2700 192

# printf "\n${PINK}Emoticons:${RESET}\n\n"
# ./unicodeTable.sh 1F600 80

# printf "\n${PINK}Miscellaneous Symbols and Pictographs:${RESET}\n\n"
# ./unicodeTable.sh 1F300 256

# printf "\n${PINK}Supplemental Symbols and Pictographs:${RESET}\n\n"
# ./unicodeTable.sh 1F900 256

# printf "\n${PINK}Symbols and Pictographs Extended-A:${RESET}\n\n"
# ./unicodeTable.sh 1FA70 144

# printf "\n${PINK}Transport and Map Symbols:${RESET}\n\n"
# ./unicodeTable.sh 1F680 128


# ┌─────────────────────────────────────┐
# │                                     │
# │                GAMES                │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Playing Cards:${RESET}\n\n"
# ./unicodeTable.sh 1F0A0 64


# ┌─────────────────────────────────────┐
# │                                     │
# │              RELIGION               │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Yijing Hexagram Symbols:${RESET}\n\n"
# ./unicodeTable.sh 4DC0 32

# printf "\n${PINK}Tai Xuan Jing Symbols:${RESET}\n\n"
# ./unicodeTable.sh 1D300 80


# ┌─────────────────────────────────────┐
# │                                     │
# │             HIEROGLYPHS             │
# │                                     │
# └─────────────────────────────────────┘
# printf "\n${PINK}Linear A:${RESET}\n\n"
# ./unicodeTable.sh 10600 368

# printf "\n${PINK}Linear B Ideograms:${RESET}\n\n"
# ./unicodeTable.sh 10080 128

# printf "\n${PINK}Linear B Syllabary:${RESET}\n\n"
# ./unicodeTable.sh 10000 96

printf "Use ./unicodeToEmoji.sh [unicode] to output symbol.\n"