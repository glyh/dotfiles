if not test -d /opt/flutter/bin
    exit
end

set -gxa PATH /opt/flutter/bin/
set -gx FLUTTER_GIT_URL "https://"$GITHUB"/flutter/flutter.git"
set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
