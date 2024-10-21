#!/usr/bin/env bash

set -x

if ! which certutil; then
    sudo apt-get update -y
    sudo apt-get install -y libnss3-tools
fi

mkdir -p root
CAROOT="$PWD/root" \
    "${MKCERT:-mkcert}" -install
