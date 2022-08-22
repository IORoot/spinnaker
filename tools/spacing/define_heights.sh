#!/bin/bash

define_heights(){

    export declare H_FULL=$(tput lines)

    export declare H_1_2=$((${H_FULL} / 2))

    export declare H_1_3=$((${H_FULL} / 3))
    export declare H_2_3=$(( (${H_FULL} / 3) * 2 ))

    export declare H_1_4=$(( (${H_FULL} / 4) ))
    export declare H_2_4=$(( (${H_FULL} / 4) * 2 ))
    export declare H_3_4=$(( (${H_FULL} / 4) * 3 ))

    export declare H_1_5=$((${H_FULL} / 5))
    export declare H_2_5=$(( (${H_FULL} / 5) * 2 ))
    export declare H_3_5=$(( (${H_FULL} / 5) * 3 ))
    export declare H_4_5=$(( (${H_FULL} / 5) * 4 ))

    export declare H_1_6=$((${H_FULL} / 6))
    export declare H_2_6=$(( (${H_FULL} / 6) * 2 ))
    export declare H_3_6=$(( (${H_FULL} / 6) * 3 ))
    export declare H_4_6=$(( (${H_FULL} / 6) * 4 ))
    export declare H_5_6=$(( (${H_FULL} / 6) * 5 ))

}