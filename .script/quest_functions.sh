KEY_1="treasure_chest/lock_1/key_1"
KEY_2="treasure_chest/lock_2/key_2"
KEY_3="treasure_chest/lock_3/key_3"
CREW="pirate_code.md"
PIRATES=( "Captain" "Quartermaster" "First mate" )
FLAG="supplies/flag.ascii"
RHUM="supplies/rhum.ascii"
SHIP="supplies/ship.ascii"

function random_exclamation {
    exclamations=( "Blimey!" "Sail Ho!" "Shiver me timbers!" "Sink me!" "Aaaarrrrgggghhhh!" "Blimey!" "Sail Ho!" "All Hand Hoy!" "Sink me!" "Scupper that!" )
    echo ${exclamations[$(date +%s | cut -c10)]}
}

function pirate_say {
    cat .script/pirate.ascii
    echo -e "$1"
}

function parrot_say {
    cat .script/parrot.ascii
    echo -e "$1"
}

function fake_checksum {
    input_file=$1
    tail -1 ${input_file} | cut -c 1-64
}

function get_key_code {
    key_nb=$1
    checksum=$(fake_checksum "treasure_chest/lock_${key_nb}/key_${key_nb}")
    cat .support_files/${checksum} | cut -c$(($key_nb*2-1)),$(($key_nb*2+3))
}

function is_valid_key {
    key_file=$1
    [[ -f .support_files/$(fake_checksum "$key_file") ]] && return 0
    return 1
}
