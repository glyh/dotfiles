# Basic info
set -gx HOME_LANG            zh

# Path
fish_add_path -gp            ~/Scripts
set -gxa PATH                ~/.local/bin
# set -gxa PATH                ~/.nimble/bin
set -gxa PATH                ~/.yarn/bin
set -gxa PATH                ~/.cargo/bin
set -gxa PATH                ~/.roswell/bin
# set -gxa PATH                /usr/lib/emscripten

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config
set -gx  XDG_CURRENT_DESKTOP sway # https://github.com/GermainZ/xdg-desktop-portal-termfilechooser

# Default utils
set -gx  VISUAL              nvim
set -gx  EDITOR              nvim
set -gx  PAGER               page
set -gx  TERM                kitty

# Firefox
set -gx MOZ_ENABLE_WAYLAND   1

# IME
set -gx GTK_IM_MODULE            fcitx
set -gx QT_IM_MODULE             fcitx
set -gx XMODIFIERS               \@im=fcitx

# CL
# set -gx  CL_SOURCE_REGISTRY  ~/Documents/CS/projects/cl

# Carp
# set -gx  CARP_DIR            ~/.carp
# set -gxa PATH                "$CARP_DIR/bin"

# CFLAGS && CXXFLAGS

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# go
set -gx  GO111MODULE         on
set -gx  GOPROXY             https://goproxy.cn
set -gx  GOPATH              ~/.config/go

# WASI
set -gx WASI_SDK_PATH       /opt/wasi-sdk

# Spawning sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway
