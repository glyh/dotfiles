# Basic info
set -gx HOME_LANG            zh

# Path
set -gxa PATH                ~/Scripts
set -gxa PATH                ~/.local/bin
# set -gxa PATH                ~/.nimble/bin
set -gxa PATH                ~/.yarn/bin
set -gxa PATH                ~/.cargo/bin
set -gxa PATH                ~/.roswell/bin
set -gxa PATH                ~/.config/emacs/bin

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config

# Default utils
set -gx  VISUAL              nvim
set -gx  EDITOR              nvim
set -gx  PAGER               page
set -gx  TERM                kitty

# Firefox
set -gx MOZ_ENABLE_WAYLAND   1

# # IME
set -gx GTK_IM_MODULE            fcitx
set -gx QT_IM_MODULE             fcitx
set -gx XMODIFIERS               \@im=fcitx

# CL
set -gx  CL_SOURCE_REGISTRY  ~/Documents/CS/projects/cl

# Carp
set -gx  CARP_DIR            ~/.carp
set -gxa PATH                "$CARP_DIR/bin"

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# Spawning sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway
