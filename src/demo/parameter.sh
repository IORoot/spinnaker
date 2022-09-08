#!/bin/bash

export PARAMETER_CONFIG_FILE="../config/parameters.json"

VERBOSE=false
echo "(before) VERBOSE:$VERBOSE"

$SPINNAKER_COMPONENTS_FOLDER/parameter.sh $@

echo "(after) VERBOSE:$VERBOSE"