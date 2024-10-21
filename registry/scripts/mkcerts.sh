#!/usr/bin/env bash

set -ex

mkdir -p certs
CAROOT="$PWD/root" \
    "${MKCERT:-mkcert}" \
    -cert-file certs/domain.crt \
    -key-file certs/domain.key \
    "$@"
