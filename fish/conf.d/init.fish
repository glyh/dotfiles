# Basic info
set -gx HOME_LANG            zh

# Path
set -gxa PATH                ~/Scripts
set -gxa PATH                ~/.local/bin
# set -gxa PATH                ~/.nimble/bin
set -gxa PATH                ~/.yarn/bin
set -gxa PATH                ~/.cargo/bin
set -gxa PATH                ~/.emacs.d/bin
for i in (luarocks path | awk '{sub(/PATH=/, "PATH ", $2); print "set -gx "$2}'); eval $i; end
set -gxa PATH                /usr/bin/core_perl
set -gxa PATH                /usr/bin/vendor_perl

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config

# Default utils
set -gx  VISUAL              nvim
set -gx  EDITOR              nvim
set -gx  PAGER               page
set -gx  TERM                alacritty

# Firefox
set -gx MOZ_ENABLE_WAYLAND   1

# IME
set GTK_IM_MODULE            fcitx
set QT_IM_MODULE             fcitx
set XMODIFIERS               \@im=fcitx

# JANET
set JANET_LIBPATH            ~/.local/lib/janet

# Spawning sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway
