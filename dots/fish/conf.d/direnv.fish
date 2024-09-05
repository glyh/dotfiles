if not type -q direnv
    exit
end

direnv hook fish | source
