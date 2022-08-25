#!/bin/bash


printf "${TEXT_STONE_400}Environment Variables for ${TEXT_STONE_100}Spinners "
sleep 0.1

# get function for defining spinner environment variable
source ./tools/spinner/define_spinner.sh

# Define all the spinners
spinner_parts() {

    define_spinner SPIN_TURN  "↑ ↗ → ↘ ↓ ↙ ← ↖"
    define_spinner SPIN_BALL  "◌ ○ ◎ ◉ ● ◉ ◎ ○"
    define_spinner SPIN_CYLON "├─────┤ ├░────┤ ├░▒───┤ ├░▒▓──┤ ├░▒▓█─┤ ├─░▒▓█┤ ├──░█▓┤ ├──█▓▒┤ ├─█▓▒░┤ ├█▓▒░─┤ ├▓▒░──┤ ├▒░───┤ ├░────┤ ├─────┤" 
    define_spinner SPIN_LOADS "├─────┤ ├█────┤ ├██───┤ ├███──┤ ├████─┤ ├█████┤" 
    define_spinner SPIN_LEVEL "├╂────┤ ├─╂───┤ ├──╂──┤ ├───╂─┤ ├────╂┤ ├───╂─┤ ├──╂──┤ ├─╂───┤ ├╂────┤" 
    define_spinner SPIN_GAMES "••••• ••••ᗤ •••ᗤᗣ ••ᗤᗣᗣ •ᗤᗣᗣᗣ ᗤᗣᗣᗣ░ ᗣᗣᗣ░░ ᗣᗣ░░░ ᗣ░░░░ ░░░░░ ░░░░• ░░░•• ░░••• ░•••• " 
    define_spinner SPIN_LORRY "${TEXT_YELLOW_400}═══════ ${TEXT_SKY_400}⛟${TEXT_YELLOW_400}═════ ${TEXT_YELLOW_400}═${TEXT_SKY_400}⛟${TEXT_YELLOW_400}════ ${TEXT_YELLOW_400}══${TEXT_SKY_400}⛟${TEXT_YELLOW_400}═══ ${TEXT_YELLOW_400}═══${TEXT_SKY_400}⛟${TEXT_YELLOW_400}══ ${TEXT_YELLOW_400}════${TEXT_SKY_400}⛟${TEXT_YELLOW_400}═ ${TEXT_YELLOW_400}═════${TEXT_SKY_400}⛟${TEXT_YELLOW_400}"
    define_spinner SPIN_SPIN  "◜ ◝ ◞ ◟"
    define_spinner SPIN_BLOW  "𛰀 𛱃 𛱄 𛱅 ○"
    define_spinner SPIN_MARK  "𐄐 𐄑 𐄒 𐄓 𐄔 𐄕 𐄖 𐄗 𐄘"
    define_spinner SPIN_DIGI  "⌏ ⌎ ⌌ ⌍"
    define_spinner SPIN_COOL  "⌬ ⌖ ⏣ ⌭ ⌱"
    define_spinner SPIN_WALK  "꜈ ꜉ ꜊ ꜋ ꜌ ꜑ ꜐ ꜏ ꜎ ꜍"
    define_spinner SPIN_UPDN  "꜒ ꜓ ꜔ ꜕ ꜖ ꜕ ꜔ ꜓"
    define_spinner SPIN_DNUP  "˩ ˨ ˧ ˦ ˥ ˦ ˧ ˨"
    define_spinner SPIN_CHOP  "☰ ☱ ☲ ☴ ☰ ☱ ☳ ☶ ☴ ☰ ☱ ☳ ☷ ☶ ☴"
    define_spinner SPIN_MOON  "🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘"
    define_spinner SPIN_GAIA  "🌍 🌎 🌏"
    define_spinner SPIN_CUBE  "⬛⬜⬜⬜⬜ ⬛⬛⬜⬜⬜ ⬛⬛⬛⬜⬜ ⬛⬛⬛⬛⬜ ⬛⬛⬛⬛⬛"

}

spinner_parts

printf "\t  ${TEXT_STONE_50}${BG_EMERALD_500} Defined ${RESET}\n"