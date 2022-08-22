#!/bin/bash

# LINKS
# - https://www.cogsci.ed.ac.uk/~richard/utf-8.cgi?input=1F600&mode=hex
# - https://graphemica.com/%F0%9F%98%80
# - https://www.unicode.org/charts/PDF/U1F600.pdf

# U1F600 = smiley

# Unicode is a 'U' followed by 4,5 or 6 HEX digits
# A unicode codepoint U+1F600 can be encoded via multiple methods.
# UTF-8, UTF-16, binary, etc...

# \x = 2-digit HEX
# \u = 4-digit HEX
# \U = any-digit HEX

# iconv - tool for converting encodings.
# man iconv_open - Show All supported encodings on system:

if [[ $# -eq 0 ]]; then
    printf "usage: \n"
    printf "(DEBUG=1) $0 [unicode codepoint: U1F600] \n"
    exit 0
fi

CODEPOINT=$1

if [[ $CODEPOINT == u\+* ]] || [[ $CODEPOINT == U\+* ]]; then
    CODEPOINT="${CODEPOINT:2}"
fi

if [[ $CODEPOINT == u* ]] || [[ $CODEPOINT == U* ]]; then
    CODEPOINT="${CODEPOINT:1}"
fi

PADDED_CODEPOINT=$(printf "%08s" $CODEPOINT)

UNICODE=$(echo -ne "${PADDED_CODEPOINT}" | sed 's/../\\x&/g')


ICON_UTF8=$(echo -ne "$UNICODE" | iconv -f UTF-32BE -t UTF-8)

if [ ! -z "${DEBUG}" ]; then
    printf "\n"
    printf "%30s | %s \n" "Parsed" "Removing the U+ at the start"
    printf "%30s | %s \n" "codepoint is" $CODEPOINT
    printf "%30s | %s \n" "Padded Unicode is:" $PADDED_CODEPOINT
    printf "%30s | %s \n" "Unicode in 2-digit bytes:" $UNICODE
    printf "%30s | %s \n" "Symbol is" $ICON_UTF8
else
    echo $ICON_UTF8
fi


