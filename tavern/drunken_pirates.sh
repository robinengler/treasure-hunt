#!/bin/bash
if [[ -d "./.script" ]]; then
    source ./.script/quest_functions.sh
else
    echo "ERROR: this script must be run from the root the git repository."
    exit 1
fi

# Pirates joke...
pirate_say "What do ye call a pirate with two eyes and two legs?!\n"
sleep 2
echo -e "A rookie!\n"

exit 0

