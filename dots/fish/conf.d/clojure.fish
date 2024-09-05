if not type -q clj
    exit
end

set -gx CLJ_CONFIG $XDG_CONFIG_HOME/clojure
set -gx SHADOW_MVN_REPO $XDG_CACHE_HOME/m2
set -gx LEIN_HOME $XDG_CONFIG_HOME/lein
# set -gxa PATH $XDG_DATA_HOME/nvim/lazy/vim-iced/bin
