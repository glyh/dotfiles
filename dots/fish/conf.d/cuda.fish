if not test -d /opt/cuda
    exit
end

set -gxa PATH /opt/cuda/bin
set -gx NVCC_PREPEND_FLAGS '-ccbin /opt/cuda/bin/g++'
