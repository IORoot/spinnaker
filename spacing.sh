#!/bin/bash

# Import script
source ./tools/spacing/define_widths.sh
source ./tools/spacing/define_heights.sh

define_widths
define_heights

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Spacing : \t${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"