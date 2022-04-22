# Fish options
fish_vi_key_bindings
set fish_greeting
set -x fish_cursor_default block
set -x fish_cursor_insert line blink
set -x fish_cursor_replace_one underscore
set -x fish_cursor_visual block
set fish_vi_force_cursor

# Plugins
starship init fish | source # Use starship
zoxide init fish | source

# Editor commands
alias e=$EDITOR
alias er="sudoedit"
function en
  if test $EDITOR = "nvim"
    nvim -u NONE
  else
    echo "Not implemented"
  end
end
alias ee="$EDITOR ~/.config/nvim/init.lua" # editor
alias es="$EDITOR ~/.config/fish/config.fish" # shell
alias ew="$EDITOR ~/.config/sway/config" # Window manager

# Tools
alias g="git"
alias l="exa"
alias ls="exa"
alias la="exa -la"
alias c="cd"
# alias f="nnn"
function f
  ranger --choosedir=$HOME/.rangerdir
  set LASTDIR (cat $HOME/.rangerdir)
  cd $LASTDIR
end
alias a="paru"
alias rm="rm -i"
alias tp="trash-put"
alias tl="trash-list"
alias te="trash-empty"
alias rt="trash-restore"
alias pg="page"
alias op="rifle"
alias nf="neofetch"
alias plz="sudo"
alias cls="clear"
alias rpt="eval (history --max=1)"
alias k="kitty +kitten"
alias m="man"

# Languages
alias py="ptpython"
#alias cl="rlwrap ros run"
alias clj="clojure -Sdeps '{:deps {reply/reply {:mvn/version \"0.5.0\"}}}' -M -m reply.main"
#alias ppip="pypy3 -m pip"
# alias wasi-clang="$WASI_SDK_PATH/bin/clang --sysroot=$WASI_SDK_PATH/share/wasi-sysroot"

thefuck --alias | source
