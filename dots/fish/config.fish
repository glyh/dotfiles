# Fish options
fish_vi_key_bindings
set fish_greeting
set -x fish_cursor_default block
set -x fish_cursor_insert line blink
set -x fish_cursor_replace_one underscore
set -x fish_cursor_visual block
set fish_vi_force_cursor

# Editor commands
abbr --add e $EDITOR
abbr --add vi $EDITOR
abbr --add pe "GITHUB=github.com proxychains4 $EDITOR"
abbr --add eu "nvim -u NONE"
abbr --add er "sudoedit"
# abbr --add ee "lvim ~/.config/lvim/config.lua" # editor
abbr --add ee "nvim ~/.config/nvim/lua/custom" # editor
abbr --add es "$EDITOR ~/.config/fish/config.fish" # shell
abbr --add eenv "$EDITOR ~/.config/fish/conf.d/env.fish" # environment variables
abbr --add ert "$EDITOR -u ~/.config/nvim/test.lua" # environment variables
abbr --add et "$EDITOR ~/.config/nvim/test.lua" # environment variables
abbr --add ew "$EDITOR ~/.config/hypr/hyprland.conf" # Window manager

# Tools
abbr --add g "git"
abbr --add g2 "GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519_2' git"
abbr --add gr "cd (git root)"
abbr --add l "eza"
abbr --add la "eza -la"
# abbr --add ncmdl "pyncmdel --load ~/.netease --save-m3u (basename \$PWD).m3u "
abbr --add ncmdl "pyncmdel --quality hires --output NetEase/{album} --save-m3u NetEase/PLAYLIST.m3u "

# https://github.com/ranger/ranger/wiki/Integration-with-other-programs#changing-directories
function f
    set tempfile (mktemp -t tmp.XXXXXX)
    command ranger --choosedir=$tempfile $argv
    set return_value $status

    if test -s $tempfile
    	set ranger_pwd (cat $tempfile)
    	if test -n $ranger_pwd -a -d $ranger_pwd
          builtin cd -- $ranger_pwd
    	end
    end

    command rm -f -- $tempfile
    return $return_value
end

abbr --add --position anywhere y "paru"

abbr --add rm "rm -i"
abbr --add tp "trash-put"
abbr --add tp "trash-put"
abbr --add tl "trash-list"
abbr --add te "trash-empty"
abbr --add rt "trash-restore"
abbr --add pg "page"
abbr --add op "rifle"
abbr --add nf "neofetch"
abbr --add plz "sudo"
abbr --add cls "clear"
abbr --add rpt "eval (history --max=1)"
abbr --add k "kitty +kitten"
abbr --add bc "bottles-cli"
abbr --add ytdlx "yt-dlp -x"
abbr --add ytdlxp "yt-dlp --proxy socks5://127.0.0.1:20170 -x"
abbr --add mu "ncmpcpp"

# Languages
abbr --add p "proxychains4"

abbr --add gacu "git add -A; git commit -m 'update'; git push"

# opam configuration
source /home/lyh/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
