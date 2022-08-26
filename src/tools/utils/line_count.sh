line_count(){

    TEXT_STRING=$1

    # replace any '\n' (newlines) with ‰
    local STRING_ARRAY=${TEXT_STRING//'\n'/$'‰'}
    local STRING_ARRAY=${STRING_ARRAY//$'\n'/$'‰'}
    
    # split by ‰ and make an array of each line
    IFS=$'‰' read -r -a ARRAY_OF_LINES <<< "$STRING_ARRAY"

    # Number of lines in array
    LINE_COUNT=${#ARRAY_OF_LINES[@]}

    echo $LINE_COUNT
}