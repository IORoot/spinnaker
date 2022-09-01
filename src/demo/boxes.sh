#!/bin/bash

# ┌─────────────────────────────────────┐
# │                                     │
# │           Boxes Examples            │
# │                                     │
# └─────────────────────────────────────┘
clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "You can create a simple box by running: ./box.sh \"Message in a box\" "

$SPINNAKER_COMPONENTS_FOLDER/box.sh "The message can be multi-line \nby putting in a newline \n'backslash + n' "

$SPINNAKER_COMPONENTS_FOLDER/box.sh "And you can add emoji too. ${ICON_1ST}"

read -n 1 -s -r -p "(1/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "TEXT_EMERALD_500" "But the fun begins when you start styling the box by changing the text colour. \ne.g.: ./box.sh \"TEXT_EMERALD_500\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "BG_SKY_500" "Change the background colour. \nbox.sh \"BG_SKY_500\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "BORDER_PURPLE_500" "Or the border colour. \nbox.sh \"BORDER_PURPLE_500\" \"Message\""

read -n 1 -s -r -p "(2/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "BORDER_GREEN_500 BG_BLUE_900 TEXT_RED_300" "Or everything at once. \nbox.sh \"BORDER_GREEN_500 BG_BLUE_900 TEXT_RED_400\" \"Message\""

read -n 1 -s -r -p "(3/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PX_4 BORDER_EMERALD_200" "You can also control the padding of the text.\nPadding X-axis by 4 characters: PX_4. \nbox.sh \"PX_4\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PX_4 PY_2 BORDER_EMERALD_200" "You can also control the padding of the text.\nPadding Y-axis by 2 lines: PY_2. \nbox.sh \"PX_4 PY_2\" \"Message\""

read -n 1 -s -r -p "(4/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PT_1 BORDER_AMBER_200" "But also control padding on each side.\nPadding TOP by 1 line: PT_1. \nbox.sh \"PT_1\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PT_1 PB_1 BORDER_AMBER_200" "Padding BOTTOM by 1 line: PB_1. \nbox.sh \"PT_1 PB_1\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PT_1 PB_1 PR_4 BORDER_AMBER_200" "Padding RIGHT by 4 Characters: PR_4. \nbox.sh \"PT_1 PB_1 PR_4\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PT_1 PB_1 PR_4 PL_3 BORDER_AMBER_200" "Padding LEFT by 3 Characters: PL_3. \nbox.sh \"PT_1 PB_1 PR_4 PL_3\" \"Message\""

read -n 1 -s -r -p "(5/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_FULL BORDER_PURPLE_200" "The width of the box can also be defined: W_FULL. \nbox.sh \"W_FULL\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_1_2 BORDER_PURPLE_200" "For instance, Half Width: W_1_2. \nbox.sh \"W_1_2\" \"Message\""

$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_1_3 BORDER_PURPLE_200" "One third W_1_3 and many others.: W_1_3. \nbox.sh \"W_1_3\" \"Message\""

read -n 1 -s -r -p "(6/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "H_FULL BORDER_PURPLE_200" "Heights too (Full height): H_FULL. \nbox.sh \"H_FULL\" \"Message\""

read -n 1 -s -r -p "(7/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "H_1_3 BORDER_PURPLE_200" "One third : H_1_3. \nbox.sh \"H_1_3\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "H_1_4 BORDER_PURPLE_200" "One quarter: H_1_4. \nbox.sh \"H_1_4\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "H_2_5 BORDER_PURPLE_200" "Two fifths and many others: H_2_5. \nbox.sh \"H_2_5\" \"Message\""

read -n 1 -s -r -p "P(8/11) ress any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_1_3 BORDER_SLATE_500" "The edges can change style.\nfrom FINE. \nbox.sh \"H_1_3 EDGE_FINE\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_1_3 EDGE_DUAL BORDER_SLATE_500" "to DUAL. \nbox.sh \"H_1_3 EDGE_DUAL\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_1_3 EDGE_WIDE BORDER_SLATE_500" "and WIDE. \nbox.sh \"H_1_3 EDGE_WIDE\" \"Message\""

read -n 1 -s -r -p "(9/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PX_2 EDGE_WIDE_T BORDER_STONE_400" "And each component of the edge can use a different icon.You have:\nTL (Top Left), T (Top), TR (Top Right)\nL (Left), R (Right)\nBL (Bottom Left), B (Bottom), BR (Bottom Right) \n\nbox.sh \"EDGE_WIDE_T\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "PX_2 EDGE_DUAL_B BORDER_STONE_400" "Each edge part can be WIDE, FINE or DUAL.\nSo EDGE_DUAL_B is a dual line on the bottom edge. \n\nbox.sh \"EDGE_DUAL_B\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "PX_2 EDGE_WIDE_TL EDGE_WIDE_TR EDGE_WIDE_BL EDGE_WIDE_BR BORDER_STONE_400" "For instance, Change the corners: EDGE_WIDE_TL EDGE_WIDE_TR EDGE_WIDE_BL EDGE_WIDE_BR. \n\nbox.sh \"EDGE_WIDE_TL EDGE_WIDE_TR EDGE_WIDE_BL EDGE_WIDE_BR\" \"Message\""

read -n 1 -s -r -p "(10/11) Press any key to continue"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_FULL BORDER_RED_400" "Lastly, we have text-alignment. Default is Left aligned. \n\nbox.sh \"W_FULL\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_FULL BORDER_RED_400 ALIGN_CENTER" "But we can align to the center. \n\nbox.sh \"W_FULL ALIGN_CENTER\" \"Message\""
$SPINNAKER_COMPONENTS_FOLDER/box.sh "W_FULL BORDER_RED_400 ALIGN_RIGHT" "Or to the right. \n\nbox.sh \"W_FULL ALIGN_RIGHT\" \"Message\""

read -n 1 -s -r -p "(11/11) Press any key to finish"; clear

$SPINNAKER_COMPONENTS_FOLDER/box.sh "PY_2 W_1_2 BORDER_EMERALD_400 ALIGN_CENTER TEXT_GREEN_200 BG_SLATE_900 EDGE_WIDE EDGE_FINE_L EDGE_FINE_TL EDGE_FINE_T" "Thanks!\nfor looking at the Boxes.sh Demo\n${ICON_STAR}"

