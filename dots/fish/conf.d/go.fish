if not type -q go
    exit
end

set -gx  GO111MODULE         on
set -gx  GOPROXY             https://goproxy.cn
set -gx  GOPATH                ~/.cache/go
