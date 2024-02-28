# Basic info
set -gx GITHUB               github.hscsec.cn
# See https://coderschool.cn/3724.html

# Nvidia Drivers
set -gx LIBVA_DRIVER_NAME nvidia
set -gx VDPAU_DRIVER nvidia

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_USER_CONFIG_DIR ~/.config

# Default utils
if type -q nvim; 
    set -gx  VISUAL              nvim
    set -gx  EDITOR              nvim
end

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
    set -gx  TERMINAL            kitty
end

# For better experience on ssh
# set -gx TERM xterm-256color

# Wayland
set -gx MOZ_ENABLE_WAYLAND   1
set -gx QT_QPA_PLATFORM          wayland

# IME
# fcitx5 recommends unset GTK_IM_MODULE
# set -gx GTK_IM_MODULE            fcitx
set -gx QT_IM_MODULE             fcitx
set -gx XMODIFIERS               \@im=fcitx

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# JAVA
set -gx JAVA_HOME            /usr/lib/jvm/default

# Path
fish_add_path -gp            ~/Binaries
