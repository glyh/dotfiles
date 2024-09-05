# Basic info
# set -gx GITHUB               gitclone.com/github.com
# See https://coderschool.cn/3724.html

# Nvidia Drivers
set -gx LIBVA_DRIVER_NAME nvidia
set -gx VDPAU_DRIVER nvidia
set -gx VK_DRIVER_FILES /usr/share/vulkan/icd.d/nvidia_icd.json

# XDG
set -gx  XDG_CONFIG_HOME     ~/.config
set -gx  XDG_CACHE_HOME     ~/.cache
set -gx  XDG_DATA_HOME     ~/.local/share
set -gx  XDG_STATE_HOME     ~/.local/state

set -gx GNUPGHOME          $XDG_DATA_HOME/gnupg 

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

# IME
# fcitx5 recommends unset GTK_IM_MODULE
# set -gx GTK_IM_MODULE            fcitx
set -gx XMODIFIERS               \@im=fcitx

# GTK themes
set -gx  GTK_THEME           Adwaita:dark

# JAVA
set -gx JAVA_HOME            /usr/lib/jvm/default

# Path
fish_add_path -gp            ~/Binaries
