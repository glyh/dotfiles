#!/usr/bin/env fish

if not type -q opam
    exit
end

source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
