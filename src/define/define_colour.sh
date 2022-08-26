#!/bin/bash

# e.g. 
# define_colour slate 500 64748b
define_colour(){

    TEXT_RGB_PREFIX='\e[38;2;'
    BG_RGB_PREFIX='\e[48;2;'
    SUFFIX='m'

    RGB=$(${SPINNAKER_TOOLS_FOLDER}/colours/hexToRGB.sh $3)

    export declare TEXT_$1_$2=${TEXT_RGB_PREFIX}${RGB}${SUFFIX}
    export declare BORDER_$1_$2=${TEXT_RGB_PREFIX}${RGB}${SUFFIX}
    export declare BG_$1_$2=${BG_RGB_PREFIX}${RGB}${SUFFIX}

}