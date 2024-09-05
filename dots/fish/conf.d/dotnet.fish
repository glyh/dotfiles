if not type -q dotnet
    exit
end

set -gxa PATH ~/.dotnet/tools
set -gx NUGET_PACKAGES $XDG_CACHE_HOME"/NuGetPackages"
