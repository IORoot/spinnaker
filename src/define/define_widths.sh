#!/bin/bash

define_widths(){

    export declare W_FULL=$(tput cols)

    export declare W_1_2=$((${W_FULL} / 2))

    export declare W_1_3=$((${W_FULL} / 3))
    export declare W_2_3=$(( (${W_FULL} / 3) * 2 ))

    export declare W_1_4=$(( (${W_FULL} / 4) ))
    export declare W_2_4=$(( (${W_FULL} / 4) * 2 ))
    export declare W_3_4=$(( (${W_FULL} / 4) * 3 ))

    export declare W_1_5=$((${W_FULL} / 5))
    export declare W_2_5=$(( (${W_FULL} / 5) * 2 ))
    export declare W_3_5=$(( (${W_FULL} / 5) * 3 ))
    export declare W_4_5=$(( (${W_FULL} / 5) * 4 ))

    export declare W_1_6=$((${W_FULL} / 6))
    export declare W_2_6=$(( (${W_FULL} / 6) * 2 ))
    export declare W_3_6=$(( (${W_FULL} / 6) * 3 ))
    export declare W_4_6=$(( (${W_FULL} / 6) * 4 ))
    export declare W_5_6=$(( (${W_FULL} / 6) * 5 ))

}