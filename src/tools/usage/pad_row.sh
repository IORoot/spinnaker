
pad_row()
{
    LINE=$1
    ROWS=$2

    # Add newlines to columns
    for ((i=1; i<=$ROWS; i++))
    do
        LINE+=' \n'
    done

    echo $LINE
}