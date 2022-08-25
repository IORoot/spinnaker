#!/bin/bash

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Padding  "
sleep 0.1

# Import script
source ./tools/padding/define_padding.sh

# ┌────────────────────────────────────┐
# │                                    │
# │             NUMBERED               │
# │                                    │
# └────────────────────────────────────┘

define_padding PX_1 1
define_padding PX_2 2
define_padding PX_3 3
define_padding PX_4 4
define_padding PX_5 5
define_padding PX_6 6
define_padding PX_7 7
define_padding PX_8 8
define_padding PX_9 9
define_padding PX_10 10
define_padding PX_12 12
define_padding PX_14 14
define_padding PX_16 16
define_padding PX_18 18
define_padding PX_20 20
define_padding PX_24 24
define_padding PX_28 28
define_padding PX_32 32
define_padding PX_36 36
define_padding PX_40 40

define_padding PY_1 1
define_padding PY_2 2
define_padding PY_3 3
define_padding PY_4 4
define_padding PY_5 5
define_padding PY_6 6
define_padding PY_7 7
define_padding PY_8 8
define_padding PY_9 9
define_padding PY_10 10
define_padding PY_12 12
define_padding PY_14 14
define_padding PY_16 16
define_padding PY_18 18
define_padding PY_20 20
define_padding PY_24 24
define_padding PY_28 28
define_padding PY_32 32
define_padding PY_36 36
define_padding PY_40 40

# ┌────────────────────────────────────┐
# │                                    │
# │           PERCENTAGES              │
# │                                    │
# └────────────────────────────────────┘

define_padding PX_FULL   $W_FULL
define_padding PX_1_2    $W_1_2
define_padding PX_1_3    $W_1_3
define_padding PX_2_3    $W_2_3
define_padding PX_1_4    $W_1_4
define_padding PX_2_4    $W_2_4
define_padding PX_3_4    $W_3_4
define_padding PX_1_5    $W_1_5
define_padding PX_2_5    $W_2_5
define_padding PX_3_5    $W_3_5
define_padding PX_4_5    $W_4_5
define_padding PX_1_6    $W_1_6
define_padding PX_2_6    $W_2_6
define_padding PX_3_6    $W_3_6
define_padding PX_4_6    $W_4_6
define_padding PX_5_6    $W_5_6

define_padding PY_FULL   $H_FULL
define_padding PY_1_2    $H_1_2
define_padding PY_1_3    $H_1_3
define_padding PY_2_3    $H_2_3
define_padding PY_1_4    $H_1_4
define_padding PY_2_4    $H_2_4
define_padding PY_3_4    $H_3_4
define_padding PY_1_5    $H_1_5
define_padding PY_2_5    $H_2_5
define_padding PY_3_5    $H_3_5
define_padding PY_4_5    $H_4_5
define_padding PY_1_6    $H_1_6
define_padding PY_2_6    $H_2_6
define_padding PY_3_6    $H_3_6
define_padding PY_4_6    $H_4_6
define_padding PY_5_6    $H_5_6


# ┌────────────────────────────────────┐
# │                                    │
# │                 TOP                │
# │                                    │
# └────────────────────────────────────┘

define_padding PT_1 1
define_padding PT_2 2
define_padding PT_3 3
define_padding PT_4 4
define_padding PT_5 5
define_padding PT_6 6
define_padding PT_7 7
define_padding PT_8 8
define_padding PT_9 9
define_padding PT_10 10
define_padding PT_12 12
define_padding PT_14 14
define_padding PT_16 16
define_padding PT_18 18
define_padding PT_20 20
define_padding PT_24 24
define_padding PT_28 28
define_padding PT_32 32
define_padding PT_36 36
define_padding PT_40 40

define_padding PT_FULL   $H_FULL
define_padding PT_1_2    $H_1_2
define_padding PT_1_3    $H_1_3
define_padding PT_2_3    $H_2_3
define_padding PT_1_4    $H_1_4
define_padding PT_2_4    $H_2_4
define_padding PT_3_4    $H_3_4
define_padding PT_1_5    $H_1_5
define_padding PT_2_5    $H_2_5
define_padding PT_3_5    $H_3_5
define_padding PT_4_5    $H_4_5
define_padding PT_1_6    $H_1_6
define_padding PT_2_6    $H_2_6
define_padding PT_3_6    $H_3_6
define_padding PT_4_6    $H_4_6
define_padding PT_5_6    $H_5_6

# ┌────────────────────────────────────┐
# │                                    │
# │               RIGHT                │
# │                                    │
# └────────────────────────────────────┘

define_padding PR_1 1
define_padding PR_2 2
define_padding PR_3 3
define_padding PR_4 4
define_padding PR_5 5
define_padding PR_6 6
define_padding PR_7 7
define_padding PR_8 8
define_padding PR_9 9
define_padding PR_10 10
define_padding PR_12 12
define_padding PR_14 14
define_padding PR_16 16
define_padding PR_18 18
define_padding PR_20 20
define_padding PR_24 24
define_padding PR_28 28
define_padding PR_32 32
define_padding PR_36 36
define_padding PR_40 40

define_padding PR_FULL   $W_FULL
define_padding PR_1_2    $W_1_2
define_padding PR_1_3    $W_1_3
define_padding PR_2_3    $W_2_3
define_padding PR_1_4    $W_1_4
define_padding PR_2_4    $W_2_4
define_padding PR_3_4    $W_3_4
define_padding PR_1_5    $W_1_5
define_padding PR_2_5    $W_2_5
define_padding PR_3_5    $W_3_5
define_padding PR_4_5    $W_4_5
define_padding PR_1_6    $W_1_6
define_padding PR_2_6    $W_2_6
define_padding PR_3_6    $W_3_6
define_padding PR_4_6    $W_4_6
define_padding PR_5_6    $W_5_6

# ┌────────────────────────────────────┐
# │                                    │
# │               BOTTOM               │
# │                                    │
# └────────────────────────────────────┘

define_padding PB_1 1
define_padding PB_2 2
define_padding PB_3 3
define_padding PB_4 4
define_padding PB_5 5
define_padding PB_6 6
define_padding PB_7 7
define_padding PB_8 8
define_padding PB_9 9
define_padding PB_10 10
define_padding PB_12 12
define_padding PB_14 14
define_padding PB_16 16
define_padding PB_18 18
define_padding PB_20 20
define_padding PB_24 24
define_padding PB_28 28
define_padding PB_32 32
define_padding PB_36 36
define_padding PB_40 40

define_padding PB_FULL   $H_FULL
define_padding PB_1_2    $H_1_2
define_padding PB_1_3    $H_1_3
define_padding PB_2_3    $H_2_3
define_padding PB_1_4    $H_1_4
define_padding PB_2_4    $H_2_4
define_padding PB_3_4    $H_3_4
define_padding PB_1_5    $H_1_5
define_padding PB_2_5    $H_2_5
define_padding PB_3_5    $H_3_5
define_padding PB_4_5    $H_4_5
define_padding PB_1_6    $H_1_6
define_padding PB_2_6    $H_2_6
define_padding PB_3_6    $H_3_6
define_padding PB_4_6    $H_4_6
define_padding PB_5_6    $H_5_6

# ┌────────────────────────────────────┐
# │                                    │
# │                LEFT                │
# │                                    │
# └────────────────────────────────────┘

define_padding PL_1 1
define_padding PL_2 2
define_padding PL_3 3
define_padding PL_4 4
define_padding PL_5 5
define_padding PL_6 6
define_padding PL_7 7
define_padding PL_8 8
define_padding PL_9 9
define_padding PL_10 10
define_padding PL_12 12
define_padding PL_14 14
define_padding PL_16 16
define_padding PL_18 18
define_padding PL_20 20
define_padding PL_24 24
define_padding PL_28 28
define_padding PL_32 32
define_padding PL_36 36
define_padding PL_40 40

define_padding PL_FULL   $W_FULL
define_padding PL_1_2    $W_1_2
define_padding PL_1_3    $W_1_3
define_padding PL_2_3    $W_2_3
define_padding PL_1_4    $W_1_4
define_padding PL_2_4    $W_2_4
define_padding PL_3_4    $W_3_4
define_padding PL_1_5    $W_1_5
define_padding PL_2_5    $W_2_5
define_padding PL_3_5    $W_3_5
define_padding PL_4_5    $W_4_5
define_padding PL_1_6    $W_1_6
define_padding PL_2_6    $W_2_6
define_padding PL_3_6    $W_3_6
define_padding PL_4_6    $W_4_6
define_padding PL_5_6    $W_5_6

printf "\t  ${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"