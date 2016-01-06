# less colors for man pages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;38;5;74m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[38;5;246m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[04;38;5;146m")

# load alias definitions
source $HOME/.config/fish/alias.fish

# load local alias definitions
source $HOME/.config/fish/alias_local.fish
