# Fish options
fish_vi_key_bindings
set fish_greeting
starship init fish | source # Use starship

# Aliases
alias e=$EDITOR
alias er="sudoedit"
alias ee="$EDITOR ~/.config/nvim/init.lua" # editor
alias es="$EDITOR ~/.config/fish/config.fish" # shell
alias ew="$EDITOR ~/.config/sway/config" # Window manager
alias g="git"
alias l="ls"
alias c="cd"
alias i="sudo light"
alias i100 "sudo light -S 100"
alias p="proxychains"
alias pg="proxychains git"
alias pa="proxychains paru"
alias a="paru"
alias ch="chezmoi"
alias rm="rm -i"
alias tp="trash-put"
alias tl="trash-list"
alias te="trash-empty"
alias rt="trash-restore"
alias py="ptpython"
alias cl="rlwrap ros run"
alias clj="clojure -Sdeps '{:deps {reply/reply {:mvn/version \"0.5.0\"}}}' -M -m reply.main"

function en
  if test $EDITOR = "nvim"
    nvim -u NONE
  else
    echo "Not implemented"
  end
end
function f
  ranger --choosedir=$HOME/.rangerdir
  set LASTDIR (cat $HOME/.rangerdir)
  cd $LASTDIR
end
