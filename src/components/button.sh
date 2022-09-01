#!/bin/bash

button()
{
    read -n 1 -s -r -p "Press any key to continue"  
}

usage()
{
    "hi"
}
# Check is file is being passed
# if [ "$#" -ne 1 ]; then
#     usage
# fi

# Run options with input values.
button $@