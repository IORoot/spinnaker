#!/bin/bash

# Links
# - https://github.com/swelljoe/spinner



default_spinner()
{
    while true; do 
        for X in '-' '/' '|' '\'; do 
            echo -en "\b$X"; 
            sleep 0.1; 
        done; 
    done 
}

bump_spinner()
{
    while true; do 
        for X in "${ICON_BUMP_100}" "${ICON_BUMP_200}" "${ICON_BUMP_300}" "${ICON_BUMP_400}" "${ICON_BUMP_700}" "${ICON_BUMP_800}"; do 
            printf "\b$X"; 
            sleep 0.1; 
        done; 
    done 
}

dots_spinner()
{
    while true; do 
        for X in "${ICON_DOTS_200}" "${ICON_DOTS_300}" "${ICON_DOTS_400}" "${ICON_DOTS_500}" "${ICON_DOTS_600}" "${ICON_DOTS_700}" "${ICON_DOTS_800}" "${ICON_DOTS_900}"; do 
            printf "\b$X"; 
            sleep 0.1; 
        done; 
    done 
}

cube_spinner()
{
    while true; do 
        for X in "${ICON_QUAD_TL}" "${ICON_AREA_T}" "${ICON_QUAD_TR}" "${ICON_AREA_R}" "${ICON_QUAD_BL}" "${ICON_AREA_B}" "${ICON_AREA_L}"; do 
            printf "\b$X"; 
            sleep 0.1; 
        done; 
    done 
}


fade_spinner()
{
    while true; do 
        for X in "${ICON_FADE_100}" "${ICON_FADE_200}" "${ICON_FADE_300}" "${ICON_FADE_400}" "${ICON_FADE_500}" "${ICON_FADE_400}" "${ICON_FADE_300}" "${ICON_FADE_200}"; do 
            printf "\b$X"; 
            sleep 0.1; 
        done; 
    done 
}

bump_spinner