#!/usr/bin/env zsh

GITHUB=github.com.cnpmjs.org
STARSHIP_CONFIG=~/.config/starship/starship.toml

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
 
# Cursor
function zle-keymap-select zle-line-init zle-line-finish {
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zinit light starship/starship

# Highlighting
zinit ice pick "zsh-syntax-highlighting.zsh"
zinit light zsh-users/zsh-syntax-highlighting

# Auto suggestion
zinit ice pick "zsh-autosuggestions.zsh"
zinit light zsh-users/zsh-autosuggestions

# Auto completion
