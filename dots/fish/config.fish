# Fish options
fish_vi_key_bindings
set fish_greeting
set -x fish_cursor_default block
set -x fish_cursor_insert line blink
set -x fish_cursor_replace_one underscore
set -x fish_cursor_visual block
set fish_vi_force_cursor

# systemctl
abbr --add suq systemctl --user status
abbr --add sus systemctl --user start
abbr --add sux systemctl --user stop
abbr --add ju journalctl --user -u

# Editor commands
abbr --add e $EDITOR
abbr --add vi $EDITOR
abbr --add eu "nvim -u NONE"
abbr --add er "sudoedit"
abbr --add ee "nvim ~/.config/nvim/init.lua" # editor
abbr --add es "$EDITOR ~/.config/fish/config.fish" # shell
abbr --add ew "$EDITOR ~/.config/hypr/hyprland.conf" # Window manager

# Tools
abbr --add g "git"
abbr --add gr "cd (git root)"
abbr --add l "eza"
abbr --add la "eza -la"

# abbr --add ncmdl "pyncmdel --load ~/.netease --save-m3u (basename \$PWD).m3u "
# abbr --add ncmdl "pyncmdel --quality hires --output NetEase/{album} --save-m3u NetEase/PLAYLIST.m3u "
abbr --add ytdl 'yt-dlp --proxy socks5://127.0.0.1:20170 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --cookies-from-browser chrome:~/.config/thorium/'
# abbr --add ytdlx "yt-dlp -x"
# abbr --add ytdlxp "yt-dlp --proxy socks5://127.0.0.1:20170 -x"

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
abbr --add --position anywhere le "| page"
abbr --add op "rifle"
abbr --add plz "sudo"
abbr --add cls "clear"
abbr --add rpt "eval (history --max=1)"
abbr --add p "proxychains -q"
abbr --add ph "HTTP_PROXY=http://127.0.0.1:20171 HTTPS_PROXY=http://127.0.0.1:20171"

abbr --add gacu "git add -A; git commit -m 'update'; git push"

abbr --add rcr  "rclone rc vfs/refresh recursive=true"
#abbr --add dosnap "sudo bcachefs subvolume snapshot -r $HOME/Documents/ /snapshots/user/(date +%Y.%m.%d)"
#abbr --add rmsnap "sudo bcachefs subvolume delete /snapshots/user/(date +%Y.%m.%d)"
abbr --add cmkbd "mkdir -p build && cd build && cmake .. && make"
abbr --add --position anywhere cpy " | wl-copy"

abbr --add dnl 'direnv allow .'
abbr --add dnshow 'direnv exec / direnv export json'
abbr --add ff 'fastfetch'
abbr --add rsync "rsync --exclude='*/_opam/' --exclude='*/venv/'"
