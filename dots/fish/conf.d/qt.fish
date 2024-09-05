#!/usr/bin/env fish

# https://github.com/qutebrowser/qutebrowser/issues/8135
set -gx QT_SCALE_FACTOR_ROUNDING_POLICY RoundPreferFloor

# https://aur.archlinux.org/packages/wechat-universal-bwrap
set -gx QT_SCALE_FACTOR 1.5

set -gx QT_IM_MODULE             fcitx
set -gx QT_QPA_PLATFORM          'xcb;wayland'
