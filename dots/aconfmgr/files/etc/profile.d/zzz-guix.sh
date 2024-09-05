# Explicitly initialize XDG base directory variables to ease compatibility
# with Guix System: see <https://issues.guix.gnu.org/56050#3>.
export XCURSOR_PATH="${XCURSOR_PATH:-/usr/local/share/icons:/usr/share/icons}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
# no default for XDG_RUNTIME_DIR (depends on foreign distro for semantics)

# _GUIX_PROFILE: `guix pull` profile
_GUIX_PROFILE="$HOME/.config/guix/current"
export PATH="$_GUIX_PROFILE/bin${PATH:+:}$PATH"

# GUIX_PROFILE: User's default profile and home profile
GUIX_PROFILE="$HOME/.guix-profile"
[ -f "$GUIX_PROFILE/etc/profile" ] && . "$GUIX_PROFILE/etc/profile"
[ -L "$GUIX_PROFILE" ] && \
GUIX_LOCPATH="$GUIX_PROFILE/lib/locale${GUIX_LOCPATH:+:}$GUIX_LOCPATH"

# Export INFOPATH so that the updated info pages can be found
# and read by both /usr/bin/info and/or $GUIX_PROFILE/bin/info
# When INFOPATH is unset, add a trailing colon so that Emacs
# searches 'Info-default-directory-list'.
export INFOPATH="$_GUIX_PROFILE/share/info:$GUIX_PROFILE/share/info:$INFOPATH"

GUIX_PROFILE="$HOME/.guix-home/profile"
[ -f "$GUIX_PROFILE/etc/profile" ] && . "$GUIX_PROFILE/etc/profile"
[ -L "$GUIX_PROFILE" ] && \
GUIX_LOCPATH="$GUIX_PROFILE/lib/locale${GUIX_LOCPATH:+:}$GUIX_LOCPATH"

export GUIX_LOCPATH

# Make Guix modules available
export GUILE_LOAD_PATH="$_GUIX_PROFILE/share/guile/site/3.0${GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH"
export GUILE_LOAD_COMPILED_PATH="$_GUIX_PROFILE/lib/guile/3.0/site-ccache${GUILE_LOAD_COMPILED_PATH:+:}$GUILE_LOAD_COMPILED_PATH"

