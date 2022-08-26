#!/bin/bash


printf "\n${TEXT_EMERALD_500}SPINNERS:${RESET}\n"

source $SPINNAKER_TOOLS_FOLDER/spinner/spin.sh

SPINNER_DONEFILE="/tmp/donespinning"

# Turn off color cycling, as it can make it harder to see the design
SPINNER_COLORCYCLE=0
SPINNER_COLORNUM=1

run_test () {
    SPINNER_SYMBOLS=$1
    # Auto cycle through colors
    if [ $SPINNER_COLORNUM -eq 7 ]; then
        SPINNER_COLORNUM=1
    else
        SPINNER_COLORNUM=$((SPINNER_COLORNUM+1))
    fi

    printf "${SPINNER_SYMBOLS}: "
    spinner &
    sleep 3
    touch "donespinning"
    sleep 0.1
    printf "\n"
}

# printf "${TEXT_PINK_500}Single character Unicode spinners${RESET_TEXT}\n"

# for s in SPIN_SPIN SPIN_LEVEL SPIN_LOAD SPIN_CYLON SPIN_TURN SPIN_PULSE; do
#   run_test ${s}
# done

# for s in SPIN_CHOP SPIN_COOL SPIN_DIGI SPIN_SPIN SPIN_BLOW SPIN_MARK ; do
#   run_test ${s}
# done

# for s in SPIN_CUBE SPIN_PACMAN SPIN_CHOP SPIN_MOON SPIN_GAIA SPIN_LORRY ; do
#   run_test ${s}
# done

for s in SPIN_UPDN SPIN_WALK ; do
    run_test ${s}
done

run_test SPIN_UPDN