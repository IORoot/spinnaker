#!/bin/bash

# ┌─────────────────────────────────────┐
# │                                     │
# │           Alerts Example            │
# │                                     │
# └─────────────────────────────────────┘

$SPINNAKER_COMPONENTS_FOLDER/alert.sh "Alerts are pretty simple. You can use them like this: alert.sh \"My Message\" INFO " INFO

$SPINNAKER_COMPONENTS_FOLDER/alert.sh "That creates an 'INFO' alert, but there are DANGER (like this one), SUCCESS, WARN, and DARK." DANGER

$SPINNAKER_COMPONENTS_FOLDER/alert.sh "They are simply a wrapper of the box.sh command with some pre-configured styling." SUCCESS

$SPINNAKER_COMPONENTS_FOLDER/alert.sh "That means you can define your own quite easily and have as many types as you like." WARN

$SPINNAKER_COMPONENTS_FOLDER/alert.sh "You can use Icons, Text Colours, Backgrounds, Wierd Edge Stylings, Widths, etc..." DARK