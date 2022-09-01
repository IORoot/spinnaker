#!/bin/bash

parameters()
{
    echo $1
}

# Check is file is being passed
if [ "$#" -ne 1 ]; then
    parameters
fi

# Run options with input values.
parameters $@