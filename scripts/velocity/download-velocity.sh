version=$1
json_response=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" https://papermc.io/api/v2/projects/velocity/versions/$version/builds)
build=$(echo "$json_response" |     jq '[.builds[] | select(.channel == "default")][-1].build')
curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" -o velocity.jar "https://papermc.io/api/v2/projects/velocity/versions/$version/builds/$build/downloads/velocity-$version-$build.jar"
echo Downloaded $1#$build
