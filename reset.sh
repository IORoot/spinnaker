#!/bin/bash

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Resets   "
sleep 0.1

export declare RESET='\e[0m'
export declare RESET_TEXT='\e[39m'
export declare RESET_BG='\e[49m'
export declare RESET_LINE='\e[0m\e[K'
export declare RESET_ALL='\e[0m\e[39m\e[49m\033[0m\033[K'

printf "\t  ${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"