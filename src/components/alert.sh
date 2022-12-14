#!/bin/bash

BOX=$SPINNAKER_COMPONENTS_FOLDER/box.sh

alert()
{
    TEXT=$1
    TYPE=$2

    if [[ "$TYPE" == "INFO" ]]; then
        $BOX "BORDER_SKY_500 TEXT_SKY_400 W_FULL PY_1 ALIGN_CENTER" "${ICON_ALERT}\n$TEXT"
    fi

    if [[ "$TYPE" == "DANGER" ]]; then
        $BOX "BORDER_RED_500 TEXT_RED_300 BG_RED_900 W_FULL PY_1 EDGE_WIDE ALIGN_CENTER" "${ICON_STOP}\n$TEXT"
    fi

    if [[ "$TYPE" == "SUCCESS" ]]; then
        $BOX "BORDER_EMERALD_500 TEXT_EMERALD_400 W_FULL PY_1 EDGE_DUAL ALIGN_CENTER" "${ICON_TICK}\n$TEXT"
    fi

    if [[ "$TYPE" == "WARN" ]]; then
        $BOX "BORDER_AMBER_500 TEXT_AMBER_400 W_FULL PY_1 EDGE_WIDE ALIGN_CENTER" "${ICON_LIMIT}\n$TEXT"
    fi

    if [[ "$TYPE" == "DARK" ]]; then
        $BOX "BORDER_GRAY_600 TEXT_GRAY_400 W_1_2 PY_1 EDGE_WIDE EDGE_FINE_T EDGE_DUAL_B ALIGN_CENTER" "${ICON_CUBE}\n$TEXT"
    fi
}

alert "$@"