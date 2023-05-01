#!/usr/bin/env bash

# set -x (long notation: set -o xtrace) traces commands before executing them.
# The value of the PS4 variable is expanded and printed before the actual debug output.
set -x
#set -o xtrace
PS4='\e[2m$BASH_SOURCE@\e[36m$LINENO ${FUNCNAME[0]} \e[0m'

echo "Press CTRL+C to proceed."
trap "pkill -f sleep" INT
trap "sleep 10" DEBUG # DEBUG is pseudo signal

echo 1
echo 2
echo 3
echo 'DA-!!'

