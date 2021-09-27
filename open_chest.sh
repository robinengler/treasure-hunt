#!/bin/bash
source .script/quest_functions.sh

# Test if all keys are present.
pirate_say "Let's see if we can open this treasure chest!\n"
sleep 1
key_nb=0
for key in $KEY_1 $KEY_2 $KEY_3; do
    key_nb=$(( key_nb + 1 ))
    if [[ ! -f "$key" ]]; then
        echo -e "$(random_exclamation) We're missing the key in lock $key_nb ! Let's go look for it, sail ho!\n"
        exit 1
    fi
    if ! $(is_valid_key "$key"); then
        echo -e "$(random_exclamation) That key in lock $key_nb isn't working! Let's find the correct one, sail ho!\n"
        exit 1
    fi
done

# Verify the keys are the correct.
echo -e "Fine job gals and lads! It looks like all keys are present.\n"
echo "Let's try to open that chest..."
for key_nb in $(seq 1 3); do
    echo -n "trying key $key_nb (drumrolls!)"
    sleep 1
    for x in $(seq 1 3); do echo -n "."; sleep 1; done
    echo " success! Sail Ho!"
    sleep 1
done
sleep 1

# Reveal treasure.
cat .script/treasure.ascii
echo "Hooray, you made it - Longsilver's treasure is finally yours! Great success :-)"
echo -e "If you are doing this exercise for the exam, here's the code: $(get_key_code 1)$(get_key_code 2)$(get_key_code 3))\n"
exit 0
