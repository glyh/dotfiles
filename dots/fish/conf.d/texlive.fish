#!/usr/bin/env fish

if not type -q tex; or not tex --version | grep "TeX Live" > /dev/null
    exit
end

set -gx TEXMFHOME $XDG_DATA_HOME/texmf
set -gx TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var, 
set -gx TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config
