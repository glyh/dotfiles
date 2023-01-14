#!/usr/bin/env sh
export XDG_CONFIG_HOME=~/.config
export XDG_USER_CONFIG_DIR=~/.config
export XDG_CURRENT_DESKTOP=sway

export VISUAL=nvim
export EDITOR=nvim
export PAGER=nvim
export MANPAGER="page -t man"

# Firefox
export MOZ_ENABLE_WAYLAND 1

# Fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# GTK themes
export GTK_THEME=Adwaita:dark

export PATH=~/Binaries:$PATH

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
