#!/bin/bash

# The harvester does all the tree-shaking, collecting and compiling

# Search through file and replace any 'source' commands with the actual content of the file 
function substitute_source()
{

    SOURCE=$1
    TARGET=$2

    if [ "$#" -ne 2 ]; then
        printf "usage: $0 <source> <target>\n"
        exit 1
    fi

    if [ "$SOURCE" == "$TARGET" ]; then
        printf "<source> and <target> are the same, aborting.\n"
        exit 1
    fi

    rm $TARGET

    printf "Processing: $SOURCE > $TARGET\n"

    while IFS= read line; do
            
        # If it's a comment, skip it.
        if [[ "$line" =~ \#.+ ]]; then
            echo "$line" >> $TARGET
            continue;

        # match . or source lines
        elif [[ "$line" =~ [[:space:]]*(\.|source)\s+.+ ]]; then
            file="$(echo $line | cut -d' ' -f2)"
            echo "Replacing: $file"
            contents=$(eval "cat ${file}")

            # Remove the #!/bin/bash line
            contents="${contents//\#\!\/bin\/bash/}" 

            # Comment out the source line
            printf "#%s\n" "$line" >> $TARGET

            # echo everything else to file
            printf "%s" "$contents" >> $TARGET

        # echo everything else.
        else
            printf "%s\n" "$line" >> $TARGET
        fi

    done < "$SOURCE"

}

substitute_source "$@"