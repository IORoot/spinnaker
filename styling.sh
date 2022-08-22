#!/bin/bash

text_styling() {

    export TEXT_DIM='\e[2m'
    export TEXT_DIM_OFF='\e[22m'

    export TEXT_ITALIC='\e[3m'
    export TEXT_ITALIC_OFF='\e[23m'

    export TEXT_UNDERLINE='\e[4m'
    export TEXT_UNDERLINE_OFF='\e[24m'

    export TEXT_INVERT='\e[7m'
    export TEXT_INVERT_OFF='\e[27m'

    export TEXT_STRIKED='\e[9m'
    export TEXT_STRIKED_OFF='\e[29m'

}
text_styling

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Styling : \t${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"