# Basic info
set -gx HOME_LANG            zh
set -gx GITHUB               https://hub.fgit.ml/
# 'github.com.cnpmjs.org'
# 'gitclone.com/github.com'
# 'hub.fastgit.org'
# 'hub.gitfast.tk'
# 'github.com'
# 'hub.fastgit.xyz'
# 'hub.0z.gs'

# SCALE, done in hyprland side
# set -gx GDK_SCALE 2
# set -gx XCURSOR_SIZE 32

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config
set -gx  XDG_CURRENT_DESKTOP gnome 
# https://github.com/GermainZ/xdg-desktop-portal-termfilechooser

# Default utils
if type -q nvim; 
    set -gx  VISUAL              nvim
    set -gx  EDITOR              nvim
end

# Emacs
set -gx DOOMGITCONFIG ~/.config/git/config

if type -q page; 
    set -gx  PAGER               page
    set -gx  MANPAGER            "page -t man"

    function m
        if test (count $argv) -lt 1
            echo "What manual page do you want? For example, try 'man man'."
        else 
            if test (count $argv) -lt 2
                set -f prog $argv[1]
            else
                set -f sect $argv[-2]
                set -f prog $argv[-1]
            end
            if man -f $argv[1] &> /dev/null
                if set -q sect 
                    page "man://"$prog"("$sect")"
                else
                    page "man://"$prog""
                end
            else
                echo "$prog: nothing appropriate."
            end
        end
    end
end
if type -q kitty; 
    set -gx  TERM                kitty
    set -gx  TERMINAL            kitty
end

# Intellij 
# set -gx  _JAVA_AWT_WM_NONREPARENTING 1

# Wayland
set -gx MOZ_ENABLE_WAYLAND   1
set -gx QT_QPA_PLATFORM          wayland

# Qutebrowser
set -gx QUTE_QT_WRAPPER          PyQt6

# IME
set -gx GTK_IM_MODULE            fcitx5
set -gx QT_IM_MODULE             fcitx5
set -gx XMODIFIERS               \@im=fcitx5

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# go
set -gx  GO111MODULE         on
set -gx  GOPROXY             https://goproxy.cn
set -gx  GOPATH                ~/.config/go

# # Flutter
# set -gx FLUTTER_STORAGE_BASE_URL https://mirrors.tuna.tsinghua.edu.cn/flutter
# set -gx PUB_HOSTED_URL https://mirrors.tuna.tsinghua.edu.cn/dart-pub
# set -gx CHROME_EXECUTABLE chromium

# JAVA
set -gx JAVA_HOME            /usr/lib/jvm/default

# Path
fish_add_path -gp            ~/Binaries
set -gxa PATH                ~/.local/bin
set -gxa PATH                ~/.cargo/bin
set -gxa PATH                ~/.nimble/bin
# set -gxa PATH                ~/.roswell/bin
set -gxa PATH                ~/.config/emacs/bin
set -gxa PATH                ~/.local/share/nvim/lazy/vim-iced/bin

type -q opam; and eval (opam env) 
if type -q racket
  set -gxa PATH                ~/.local/share/racket/(racket -v | grep -o '[0-9.]\+[0-9]')/bin
end

# if type -q rbenv 
#   status --is-interactive; and rbenv init - fish | source
# end

