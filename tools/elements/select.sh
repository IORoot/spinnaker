#!/bin/bash

selectbox(){

    BOX=$(./box.sh "TEXT_BLUE_400"  "Example box")

    printf "$BOX"

    ./box.sh "TEXT_BLUE_400 BORDER_BLUE_700 PX_1 PY_1"  "${BOX}"

}

selectbox