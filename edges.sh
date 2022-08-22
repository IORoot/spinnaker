#!/bin/bash

# Import script
source ./tools/edge/define_edge.sh

## Fine edges
define_edge EDGE_FINE $ICON_0FF0 $ICON_FH $ICON_00FF $ICON_FV $ICON_F00F $ICON_FH $ICON_FF00 $ICON_FV

## Wide edges
define_edge EDGE_WIDE $ICON_0WW0 $ICON_WH $ICON_00WW $ICON_WV $ICON_W00W $ICON_WH $ICON_WW00 $ICON_WV

## Dual edges
define_edge EDGE_DUAL $ICON_0DD0 $ICON_DH $ICON_00DD $ICON_DV $ICON_D00D $ICON_DH $ICON_DD00 $ICON_DV

## Dots edges
define_edge EDGE_DOTS $ICON_TL $ICON_FH_DOTS $ICON_TR $ICON_FV_DOTS $ICON_BR $ICON_FH_DOTS $ICON_BL $ICON_FV_DOTS


printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Edges : \t${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"