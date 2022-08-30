#function returning length of array
#returns zero if key in parameter does not exist or is not an array
#usage: VAR=$(getarrlen foo.bar) #get length of array "bar" contained within "foo"
#       VAR=$(getarrlen) #get length of the root unnamed array
#       VAR=$(getarrlen [2].foo.bar) #get length of array "bar" contained within "foo", which is stored in the root unnamed array on position 2
function getarrlen {
    #reformat key string (parameter) to what JSON.sh uses
    # KEYSTRING=$(sed -e '/^\[/! s/\[/\"\,/g' -e 's/\]\./\,\"/g' -e 's/\./\"\,\"/g' -e '/^$/! {/^\[/! s/^/\[\"/g}' -e '/^$/! s/$/\"\,/g' -e 's/\[/\\\[/g' -e 's/\]/\\\]/g' -e 's/\,/\\\,/g' -e '/^$/ s/^/\\\[/g' <<< "$@")
    KEYSTRING=$(sed -e '/^\[/! s/\[/\"\,/g' -e 's/\]\./\,\"/g' -e 's/\./\"\,\"/g' -e '#^$#! {/^\[/! s/^/\[\"/g}' -e '/^$/! s/$/\"\,/g' -e 's/\[/\\\[/g' -e 's/\]/\\\]/g' -e 's/\,/\\\,/g' -e '/^$/ s/^/\\\[/g' <<< "$@")
    #extract the key array length - get last index
    LEN=$(grep -o "${KEYSTRING}[0-9]*" <<< "$JSON_PARSED" | tail -n -1 | grep -o "[0-9]*$")
    #increment to get length, if empty => zero
    if [ -n "$LEN" ]; then
        LEN=$(($LEN+1))
    else
        LEN="0"
    fi
    echo "$LEN"
}