
# Define edges of a box into eight parts
# Including corners and borders.
# ╭ ─────── ╮
#
# │         │
#
# ╰ ─────── ╯
# 
# Usage:
# define_edge NAME $TL $T $TR $R $BR $B $BL $L
#
define_edge(){

    NAME=$1

    export declare "${NAME}_TL"=$2
    export declare "${NAME}_T"=$3
    export declare "${NAME}_TR"=$4
    export declare "${NAME}_R"=$5
    export declare "${NAME}_BR"=$6
    export declare "${NAME}_B"=$7
    export declare "${NAME}_BL"=$8
    export declare "${NAME}_L"=$9

}