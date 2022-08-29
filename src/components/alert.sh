#!/bin/bash

BOX=$SPINNAKER_COMPONENTS_FOLDER/box.sh

alert()
{
    TEXT=$1
    INFO=$2
    $BOX "BORDER_SKY_500 W_FULL PY_1 TEXT_SKY_400 ALIGN_CENTER" "Info alert!\nmulti\n${ICON_ROCKET} ROCKET"
}
alert "$@"