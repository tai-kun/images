#!/usr/bin/env bash

set -eu

user="$1"
pass="$2"

out='auth/htpasswd'
tmp='auth/htpasswd.tmp'

mkdir -p auth
docker run --rm \
    --entrypoint htpasswd \
    httpd:2 -Bbn "$user" "$pass" |
    cat >>"$out"

# trim blank lines
cp "$out" "$tmp"
rm "$out"
while IFS= read -r line; do
    if [[ -n "$line" ]]; then
        echo "$line" >>"$out"
    fi
done <"$tmp"
rm "$tmp"
