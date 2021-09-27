#!/bin/bash
source .script/quest_functions.sh

# Quest starts here...
pirate_say "Welcome to this quest Pirates!"
sleep 1
echo -e "To start, each team member should read the pirate's code and sign it.\n"
sleep 2

# Crew member onboarding
echo "Let's see if this was done properly..."
sleep 1
if [[ ! -f "$CREW" ]]; then
    echo "$(random_exclamation) We're missing the pirate code!"
    echo -e "Did you delete the '$CREW' file by mistake? Please restore it.\n"
    exit 1
fi

for member in "${PIRATES[@]}"; do
    if [[ ! $( grep "^${member}" $CREW ) ]] || [[ $( grep "^$member\ *:\ *NAME" $CREW ) ]]; then
        echo -e "$(random_exclamation) We're missing the ${member}'s signature on the pirate's code!\n"
        exit 1
    fi
done

echo -e "The following pirates have signed the code:\n"
grep "^Captain\|^Quartermaster\|^First mate" $CREW
sleep 2

echo -e "\nCongrats for the paperwork - let's get on that ship and sail!\n"
exit 0
