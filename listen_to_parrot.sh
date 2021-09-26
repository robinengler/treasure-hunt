#!/bin/bash
source .script/quest_functions.sh

# Parrot welcome
parrot_say "You're here for John Longsilver's treasure?"
sleep 1

# Parrot is not being helpful...
for i in $( seq 1 10); do
    echo "I don't remember anything..."
    sleep 2
done
