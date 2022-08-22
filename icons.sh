#!/bin/bash

# Import script
source ./tools/icons/define_icon.sh

# ┌────────────────────────────────────┐
# │                                    │
# │               BLOCKS               │
# │                                    │
# └────────────────────────────────────┘

# Block Empty full-width
#  █
define_icon ICON_BLOCK_EMPTY 2000
define_icon ICON_BLOCK_FULL  2588

# Step increases upwards
#  ▁▂▃▄▅▆▇█
define_icon ICON_STEP_100 2000 
define_icon ICON_STEP_200 2581 
define_icon ICON_STEP_300 2582
define_icon ICON_STEP_400 2583
define_icon ICON_STEP_500 2584
define_icon ICON_STEP_600 2585
define_icon ICON_STEP_700 2586
define_icon ICON_STEP_800 2587
define_icon ICON_STEP_900 2588

# Fill. Fill increases right-to-left
#  ▏▎▍▌▋▊▉█
define_icon ICON_FILL_100 2000
define_icon ICON_FILL_200 258F
define_icon ICON_FILL_300 258E
define_icon ICON_FILL_400 258D
define_icon ICON_FILL_500 258C
define_icon ICON_FILL_600 258B
define_icon ICON_FILL_700 258A
define_icon ICON_FILL_800 2589
define_icon ICON_FILL_900 2588

# Gradient Fade
#  ░▒▓█
define_icon ICON_FADE_100 2000
define_icon ICON_FADE_200 2591
define_icon ICON_FADE_300 2592
define_icon ICON_FADE_400 2593
define_icon ICON_FADE_500 2588

# Area
# ▀ ▐ ▄ ▌
define_icon ICON_AREA_T 2580
define_icon ICON_AREA_R 2590
define_icon ICON_AREA_B 2584
define_icon ICON_AREA_L 258C

# Side
# ▔ ▕ ▁ ▏
define_icon ICON_SIDE_T 2594
define_icon ICON_SIDE_R 2595
define_icon ICON_SIDE_B 2581
define_icon ICON_SIDE_L 258F

# Quad
# ▘▝
# ▖▗ 
define_icon ICON_QUAD_TL 2598
define_icon ICON_QUAD_TR 259D
define_icon ICON_QUAD_BL 2596
define_icon ICON_QUAD_BR 2597

# Part
# ▟ ▙ ▜ ▛
define_icon ICON_PART_TL 259F
define_icon ICON_PART_TR 2599
define_icon ICON_PART_BL 259C
define_icon ICON_PART_BR 259B

# Grid
# ▚  ▞
define_icon ICON_GRID_LR 259A
define_icon ICON_GRID_RL 259E

# ┌────────────────────────────────────┐
# │                                    │
# │            FINE LINES              │
# │                                    │
# └────────────────────────────────────┘

# Fine Horizontal (NH) Lines 
# ─ ┄ ┈ ╴ ╶ ╼ ╌
define_icon ICON_FH      2500
define_icon ICON_FH_DASH 2504
define_icon ICON_FH_DOTS 2508
define_icon ICON_FH_L    2578
define_icon ICON_FH_R    257A
define_icon ICON_FH_WH   257C
define_icon ICON_FH_CUT  254C

# Fine Vertical (TV) Lines 
# │ ┆ ┊ ╵ ╷ ╽ ╎
define_icon ICON_FV      2502
define_icon ICON_FV_DASH 2506
define_icon ICON_FV_DOTS 250A
define_icon ICON_FV_T    2575
define_icon ICON_FV_B    2577
define_icon ICON_FV_WV   257D     
define_icon ICON_FV_CUT  254E  


# ┌────────────────────────────────────┐
# │                                    │
# │            WIDE LINES              │
# │                                    │
# └────────────────────────────────────┘

# Wide Horizontal (WH) Lines
# ━ ┅ ┉ ╸ ╺ ╾ ╍
define_icon ICON_WH      2501
define_icon ICON_WH_DASH 2505
define_icon ICON_WH_DOTS 2509
define_icon ICON_WH_L    2574
define_icon ICON_WH_R    2576
define_icon ICON_WH_FH   257E
define_icon ICON_WH_CUT  254D

# Wide Vertical (WV) Lines 
# ┃ ┇ ┋ ╹ ╻ ╿ ╏
define_icon ICON_WV      2503
define_icon ICON_WV_DASH 2507
define_icon ICON_WV_DOTS 250B
define_icon ICON_WV_T    2579
define_icon ICON_WV_B    257B
define_icon ICON_WV_FV   257F     
define_icon ICON_WV_CUT  254F 


# ┌────────────────────────────────────┐
# │                                    │
# │            PAIR LINES              │
# │                                    │
# └────────────────────────────────────┘

# F = Fine, W = Wide, 0 = Null, D = Double
# Order of precidence (T)op > (R)ight > (B)ottom > (L)eft
# FW0F = Fine Top, Wide Right, No Bottom, Fine Left.

# └ ┕ ┘ ┙
define_icon ICON_FF00   2514   
define_icon ICON_FW00   2515   
define_icon ICON_F00F   2518   
define_icon ICON_F00W   2519   

# ┖ ┗ ┚ ┛
define_icon ICON_WF00   2516   
define_icon ICON_WW00   2517   
define_icon ICON_W00F   251A   
define_icon ICON_W00W   251B  

# ┌ ┎ ┐ ┑ ┍ ┏ ┒ ┓ 
define_icon ICON_0FF0   250C   
define_icon ICON_0FW0   250E   
define_icon ICON_00FF   2510   
define_icon ICON_00FW   2511 
define_icon ICON_0WF0   250D   
define_icon ICON_0WW0   250F   
define_icon ICON_00WF   2512   
define_icon ICON_00WW   2513  

# ┌────────────────────────────────────┐
# │                                    │
# │           TRIPLE LINES             │
# │                                    │
# └────────────────────────────────────┘

# Joining 3 lines together
# ├ ┝ ┟ ┢ ┤ ┥ ┧ ┪ ┴ ┵ ┶ ┷
define_icon ICON_FFF0   251C    
define_icon ICON_FWF0   251D    
define_icon ICON_FFW0   251F    
define_icon ICON_FWW0   2522 
define_icon ICON_F0FF   2524    
define_icon ICON_F0FW   2525    
define_icon ICON_F0WF   2527    
define_icon ICON_F0WW   252A  
define_icon ICON_FF0F   2534    
define_icon ICON_FF0W   2535    
define_icon ICON_FW0F   2536    
define_icon ICON_FW0W   2537 


# ┞ ┞ ┠ ┡ ┣ ┦ ┨ ┩ ┫ ┸ ┹ ┺ ┻
define_icon ICON_WFF0   251E    
define_icon ICON_WFW0   2520    
define_icon ICON_WWF0   2521    
define_icon ICON_WWW0   2523 
define_icon ICON_W0FF   2526    
define_icon ICON_W0WF   2528    
define_icon ICON_W0FW   2529    
define_icon ICON_W0WW   252B 
define_icon ICON_WF0F   2538    
define_icon ICON_WF0W   2539    
define_icon ICON_WW0F   253A    
define_icon ICON_WW0W   253B 

# ┬ ┭ ┰ ┱ ┮ ┯ ┲ ┳ 
define_icon ICON_0FFF   252C    
define_icon ICON_0FFW   252D    
define_icon ICON_0FWF   2530    
define_icon ICON_0FWW   2531   
define_icon ICON_0WFF   252E    
define_icon ICON_0WFW   252F    
define_icon ICON_0WWF   2532    
define_icon ICON_0WWW   2533 

# ┌────────────────────────────────────┐
# │                                    │
# │            QUAD LINES              │
# │                                    │
# └────────────────────────────────────┘

# Joining 4 lines together
# ┼ ┽ ┾ ┿ ╁ ╅ ╆ ╈
define_icon ICON_FFFF   253C
define_icon ICON_FFFW   253D
define_icon ICON_FWFF   253E
define_icon ICON_FWFW   253F
define_icon ICON_FFWF   2541
define_icon ICON_FFWW   2545
define_icon ICON_FWWF   2546
define_icon ICON_FWWW   2548

# ╀ ╂ ╃ ╄ ╇ ╉ ╊ ╋
define_icon ICON_WFFF   2540
define_icon ICON_WFWF   2542
define_icon ICON_WFFW   2543
define_icon ICON_WWFF   2544
define_icon ICON_WWFW   2547
define_icon ICON_WFWW   2549
define_icon ICON_WWWF   254A
define_icon ICON_WWWW   254B



# ┌────────────────────────────────────┐
# │                                    │
# │            DUAL LINES              │
# │                                    │
# └────────────────────────────────────┘

# Dual Horizontal (DH) Lines 
# ═
define_icon ICON_DH 2550

# Dual Vertical (DV) Lines 
# ║
define_icon ICON_DV 2551


# PAIR DUAL LINES
# ╘ ╛
define_icon ICON_FD00 2558
define_icon ICON_F00D 255B

# ╙ ╚  ╜ ╝
define_icon ICON_DF00 2559
define_icon ICON_DD00 255A
define_icon ICON_D00F 255C
define_icon ICON_D00D 255D

# ╒ ╓ ╔ ╕ ╖ ╗  
define_icon ICON_0DF0 2552
define_icon ICON_0FD0 2553
define_icon ICON_0DD0 2554
define_icon ICON_00FD 2555
define_icon ICON_00DF 2556
define_icon ICON_00DD 2557


# TRIPLE DUAL LINES

# ╞ ╡ ╧
define_icon ICON_FDF0 255E
define_icon ICON_F0FD 2561
define_icon ICON_FD0D 2567

# ╟ ╠ ╢ ╣ ╨ ╩
define_icon ICON_DFD0 255F
define_icon ICON_DDD0 2560
define_icon ICON_D0DF 2562
define_icon ICON_D0DD 2563
define_icon ICON_DF0F 2568
define_icon ICON_DD0D 2569

# ╤ ╥ ╦ 
define_icon ICON_0DFD 2564
define_icon ICON_0FDF 2565
define_icon ICON_0DDD 2566


# QUAD DUAL LINES
# ╪
define_icon ICON_FDFD 256A

# ╫ ╬
define_icon ICON_DFDF 256B
define_icon ICON_DDDD 256C


# ┌────────────────────────────────────┐
# │                                    │
# │            BEND LINES              │
# │                                    │
# └────────────────────────────────────┘

# ╭ ╮ ╯╰
define_icon ICON_TL 256D
define_icon ICON_TR 256E
define_icon ICON_BR 256F
define_icon ICON_BL 2570

# ┌────────────────────────────────────┐
# │                                    │
# │            CHOP LINES              │
# │                                    │
# └────────────────────────────────────┘

# ╱ ╲ ╳
define_icon ICON_RL 2571
define_icon ICON_LR 2572
define_icon ICON_X 2573

# ┌────────────────────────────────────┐
# │                                    │
# │              BRAILLE               │
# │                                    │
# └────────────────────────────────────┘

# BUMPS
# ⣾ ⣷ ⣯ ⣟ ⡿ ⢿ ⣻ ⣽ ⣿
define_icon ICON_BUMP_100 28FE
define_icon ICON_BUMP_200 28F7
define_icon ICON_BUMP_300 28EF
define_icon ICON_BUMP_400 28DF
define_icon ICON_BUMP_500 287F
define_icon ICON_BUMP_600 28BF
define_icon ICON_BUMP_700 28FB
define_icon ICON_BUMP_800 28FD
define_icon ICON_BUMP_900 28FF

# DOTS
# ⠀⠈⠐⠠⢀⡀⠄⠂⠁
define_icon ICON_DOTS_100 2800
define_icon ICON_DOTS_200 2808
define_icon ICON_DOTS_300 2810
define_icon ICON_DOTS_400 2820
define_icon ICON_DOTS_500 2880
define_icon ICON_DOTS_600 2840
define_icon ICON_DOTS_700 2804
define_icon ICON_DOTS_800 2802
define_icon ICON_DOTS_900 2801

# ┌────────────────────────────────────┐
# │                                    │
# │               Aegean               │
# │                                    │
# └────────────────────────────────────┘

printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Icons : \t${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"