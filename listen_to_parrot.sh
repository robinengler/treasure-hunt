#!/bin/bash
source .script/quest_functions.sh

# Parrot welcome
parrot_say "You're here for John Longsilver's treasure?"
sleep 1

# Parrot remembers stuff...
echo "Ah I miss John... such a good pirate..."
sleep 1
echo "The treasure... yes, I was with John when he was hiding it!"
sleep 1

echo "At that time he often spent time in the following 3 locations:"
echo " * key_1: Port-Royal, John Longsilver's ship is still docked there, visit the captain's cabin."
echo " * key_2: Blackbeard's castle, in the west tower of the castle."
echo " * key_3: Oyster bay, the old lighthouse, that was a pirate meeting place."
echo " "
sleep 2

# Parrot gives a hint...
for i in $( seq 1 10); do
    echo "It's in the rhum bottles..."
    sleep 2
done
