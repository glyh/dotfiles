#!/usr/bin/env fish
if not type -q elixir
    exit
end

set -gx HEX_MIRROR "https://hexpm.upyun.com"
set -gx HEX_CDN "https://hexpm.upyun.com"
