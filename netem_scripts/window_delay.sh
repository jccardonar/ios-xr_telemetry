#!/bin/bash
#
# netem delay script to randomize when tc-netem values are changed -- used to provide inconsistent times for which delay changes in tc-netem
# developed by quinn snyder | snyderq@gmail.com
# release v0.1 | targeted for triangle topology of xrv9000 routers using netem host between each router link

# define path to netem delay randomization script
script="/root/netem_scripts/delay_randomization.sh"

# define length of window in which script should fire (in minutes)
window=4

# use modulus command to ensure random number of minutes between now and window
rmin=$(( $RANDOM % $window ))

# use at to fire off the script
echo "$script" | at now + "${rmin}" min

# prior to using, ensure that you edit crontab for desired user (usually root) through crontab -e to call this script at a time equal to equal to window +1 to avoid conflicts
#
# example:
# */5 * * * * /root/netem_scripts/window_delay.sh