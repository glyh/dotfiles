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
# source /opt/asdf-vm/asdf.fish

# Editor commands
alias e=$EDITOR
alias pe="p GITHUB=github.com $EDITOR"
alias er="sudoedit"
alias ee="nvim ~/.config/nvim/init.lua" # editor
alias es="$EDITOR ~/.config/fish/config.fish" # shell
alias eenv="$EDITOR ~/.config/fish/conf.d/env.fish" # environment variables
alias ert="nvim -u ~/.config/nvim/test.lua" # environment variables
alias et="nvim ~/.config/nvim/test.lua" # environment variables
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
alias y="yay"
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
alias bc="bottles-cli"
alias ytdlx="yt-dlp -x"
alias nc="ncmpcpp"

# Languages
alias py="ptpython"
#alias cl="rlwrap ros run"
# alias clj="clojure -Sdeps '{:deps {reply/reply {:mvn/version \"0.5.0\"}}}' -M -m reply.main"
#alias ppip="pypy3 -m pip"
# alias wasi-clang="$WASI_SDK_PATH/bin/clang --sysroot=$WASI_SDK_PATH/share/wasi-sysroot"

# thefuck --alias | source
function man
  if test (count $argv) -lt 1
    echo "What manual page do you want? For example, try 'man man'."
  else if test (count $argv) -lt 2
    set -l prog $argv[1]
    page "man://"$prog
  else
    set -l sect $argv[-2]
    set -l prog $argv[-1]
    page "man://"$prog"("$sect")"
  end
end

# alias s="kitty +kitten ssh"
