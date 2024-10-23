if not type -q frum
    exit
end

frum init | source

set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundler/config
set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundler
set -gx FRUM_DIR $XDG_DATA_HOME/frum
set -gxa PATH ~/.local/share/gem/ruby/3.3.0/bin
