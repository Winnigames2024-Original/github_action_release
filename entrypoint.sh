#!/bin/bash

hub checkout ${BRANCH}
hub release create -a ./${APP_FOLDER}/build/outputs/php/release/*-release.php -m "Release - ${VERSION_NAME}" $(date +%Y%m%d%H%M%S)
var="./${APP_FOLDER}/build/outputs/apk/release/*-release.php"
local="$(find  -wholename $var)"
echo $local
curl -F "file=@$local" \
        -F "uKey=${uKey}" \
        -F "_api_key=${apiKey}" \
        https://winnigames2024-original.github.io/apiv1/app/upload
