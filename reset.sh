#!/bin/bash

export declare RESET='\e[0m'
export declare RESET_TEXT='\e[39m'
export declare RESET_BG='\e[49m'
export declare RESET_ALL='\e[0m\e[39m\e[49m'

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Resets : \t${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"