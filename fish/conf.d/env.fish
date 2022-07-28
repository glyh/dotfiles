# Basic info
set -gx HOME_LANG            zh
set -gx GITHUB               'hub.gitfast.tk'
# 'github.com.cnpmjs.org'
# 'gitclone.com/github.com'
# 'hub.fastgit.org'
# 'hub.gitfast.tk'
# 'github.com'
# 'hub.fastgit.xyz'
# 'hub.0z.gs'

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config
set -gx  XDG_CURRENT_DESKTOP sway # https://github.com/GermainZ/xdg-desktop-portal-termfilechooser

# Default utils
set -gx  VISUAL              nvim
set -gx  EDITOR              nvim
set -gx  PAGER               page
set -gx  MANPAGER            "page -t man"
set -gx  TERM                alacritty

# Firefox
set -gx MOZ_ENABLE_WAYLAND   1

# IME
set -gx GTK_IM_MODULE            fcitx5
set -gx QT_IM_MODULE             fcitx5
set -gx XMODIFIERS               \@im=fcitx5

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# go
set -gx  GO111MODULE         on
set -gx  GOPROXY             https://goproxy.cn
set -gx  GOPATH              ~/.config/go

# gerbil
# set -gx  GERBIL_HOME         /opt/gerbil-scheme
# set -gx  GERBIL_GSC          (which gambitc)

# WASI
set -gx WASI_SDK_PATH        /opt/wasi-sdk

# Path
fish_add_path -gp            ~/Scripts
set -gxa PATH                ~/.local/bin
set -gxa PATH                ~/.yarn/bin
set -gxa PATH                ~/.cargo/bin
set -gxa PATH                ~/.roswell/bin
set -gxa PATH                /usr/lib/emscripten
set -gxa PATH                $GERBIL_HOME/bin
set -gxa PATH                /opt/jython/bin
