if not test -d /opt/cuda
    exit
end

set -gxa PATH /opt/cuda/bin
set -gx NVCC_PREPEND_FLAGS "-ccbin /opt/cuda/bin/g++"
set -gx CUDA_CACHE_PATH $XDG_CACHE_HOME"/cuda"
