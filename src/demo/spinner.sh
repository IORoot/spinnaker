#!/bin/bash

# Spinner types MUST be single-character ones.

# spinner "COMMAND" "InProgress Message" "Task Name" ($SPINNER_TYPE)
$SPINNAKER_COMPONENTS_FOLDER/spinner.sh "uname -a" "Working" "Uname" "$SPIN_GAIA"
$SPINNAKER_COMPONENTS_FOLDER/spinner.sh "sleep 3" "Working" "Sleep 3 seconds" 
$SPINNAKER_COMPONENTS_FOLDER/spinner.sh "whoami" "Working" "Whoami" "$SPIN_MOON"