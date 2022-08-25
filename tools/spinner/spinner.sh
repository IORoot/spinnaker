#!/bin/sh

# shellcheck disable=SC2034 disable=SC2039
# Config variables, set these after sourcing to change behavior.
SPINNER_COLORNUM=2 # What color? Irrelevent if COLORCYCLE=1.
SPINNER_COLORCYCLE=1 # Does the color cycle?
SPINNER_DONEFILE="/tmp/donespinning" # Path/name of file to exit on.
SPINNER_SYMBOLS="SPIN_UPDN" # Name of the variable containing the symbols.
SPINNER_CLEAR=1 # Blank the line when done.
SPINNER_SPEED=0.1

# Stop the spinner
stopspin()
{
  sleep 0.1
  touch "/tmp/donespinning"
}

# Handle signals
cleanup () {
  touch ${SPINNER_DONEFILE}  # Add the donefile
	tput rc                    # Restore the cursor position
	tput cnorm                  # makes cursor visible again
  stopspin
	return 1
}

# This tries to catch any exit, to reset cursor
# Run the 'cleanup' function
trap cleanup INT QUIT TERM

# Run function
spinner () {

  # Delete any old donefile
  rm -f ${SPINNER_DONEFILE}

  local SPINNER_NORMAL

  # Turn off all attributes (unlines, bold, etc)
  SPINNER_NORMAL=$(tput sgr0)

  # Using indirection, Put the current spinner symbols into a variable called $SYMBOLS
  eval SYMBOLS=\$${SPINNER_SYMBOLS}

  # Get the parent ProcessID 
  SPINNER_PPID=$(ps -p "$$" -o ppid=)

  # The : means NULL. "While NULL"
  while :; do

    trap cleanup INT QUIT TERM
    
    # Hide the cursor
    tput civis

    # Split each symbol up (by spaces) and allocate it to 'c'
    for c in ${SYMBOLS}; do

      # If the 'cycle' variable is set
      if [ $SPINNER_COLORCYCLE -eq 1 ]; then

        # If the 'colour' variable is set to 7?, return back to 1.
        if [ $SPINNER_COLORNUM -eq 7 ]; then
          SPINNER_COLORNUM=1
        
        # Else +1 
        else
          SPINNER_COLORNUM=$((SPINNER_COLORNUM+1))
        fi
      fi

      # Set a foreground colour using ANSI escape code
      local COLOR
      COLOR=$(tput setaf ${SPINNER_COLORNUM})

      # Save the cursor position
      tput sc

      # Print the Colour + Current Symbol + Reset all attributes.
      printf "${COLOR}${c}${SPINNER_NORMAL}"

      # Restore the cursor position
      tput rc

      # Check for the 'done' file called  'stopspinning'
      if [ -f "${SPINNER_DONEFILE}" ]; then

        # If variable is set to Blank the line 
        if [ ${SPINNER_CLEAR} -eq 1 ]; then
          # clear to end of line
          tput el
        fi

        # Delete the donefile
        rm -f ${SPINNER_DONEFILE}

        # Break out of (2) loops
        break 2
      fi

      # This is questionable. sleep with fractional seconds is not
      # always available, but seems to not break things, when not.
      env sleep $SPINNER_SPEED

      # Check to be sure parent is still going; handles sighup/kill
      if [ ! -z "$SPINNER_PPID" ]; then

        # This is ridiculous. ps prepends a space in the ppid call, which breaks
        # this ps with a "garbage option" error.
        # XXX Potential gotcha if ps produces weird output.
        # shellcheck disable=SC2086
        # Doesn't work on MACOS with --no-headers
        # SPINNER_PARENTUP=$(ps --no-headers $SPINNER_PPID)

        # Using a single column 'pid' and removing the header
        SPINNER_PARENTUP=$(ps -p $SPINNER_PPID -o 'pid' | tail +2)
        if [ -z "$SPINNER_PARENTUP" ]; then
          break 2
        fi
        
      fi
    done
  done

  # makes cursor visible again
  tput cnorm
  return 0
}