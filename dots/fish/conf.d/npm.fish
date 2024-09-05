#!/usr/bin/env fish
if not type -q npm
    exit
end

set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config
