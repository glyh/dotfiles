#!/usr/bin/env fish
if not type -q emacs
    exit
end


# For doom emacs
set -gxa PATH ~/.config/emacs/bin
set -gx DOOMGITCONFIG ~/.config/git/config
