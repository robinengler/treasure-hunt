KEY_1="lock_1/key_1"
KEY_2="lock_2/key_2"
KEY_3="lock_3/key_3"
CREW="pirate_code.md"
PIRATES=( "Captain" "Quartermaster" "First mate" )

function random_exclamation {
    exclamations=( "Blimey!" "Sail Ho!" "Shiver me timbers!" "Sink me!" "Aaaarrrrgggghhhh!" "Blimey!" "Sail Ho!" "All Hand Hoy!" "Sink me!" "Scupper that!" )
    echo ${exclamations[$(date | cut -f5 -d " " | cut -c 8)]}
}

function pirate_say {
    cat .script/pirate.ascii
    echo -e "$1"
}

function parrot_say {
    cat .script/parrot.ascii
    echo -e "$1"
}

function get_key_code {
    key_nb=$1
    cat .support_files/$(sha256sum "lock_${key_nb}/key_${key_nb}" | cut -c1-64) | cut -c$(($key_nb*2-1)),$(($key_nb*2+3))
}
