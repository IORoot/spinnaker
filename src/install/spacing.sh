#!/bin/bash

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Spacing  "
sleep 0.1

# Import script
source $SPINNAKER_DEFINE_FOLDER/define_widths.sh
source $SPINNAKER_DEFINE_FOLDER/define_heights.sh

define_widths
define_heights

printf "\t  ${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"