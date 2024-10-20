#!/usr/bin/env bash

set -euo pipefail

tag_prefix="${TAG_PREFIX:-}"
tag_suffix="${TAG_SUFFIX:-}"

echo "$CSV_LIST" |
    tr ',' '\n' |
    sed 's/^[ \t]*//;s/[ \t]*$//' |
    grep -v '^$' | sed "s|^|$tag_prefix|" |
    grep -v '^$' | sed "s|$|$tag_suffix|" |
    grep -v '^$' | sed "s|^|ghcr.io/$REPO_OWNER/$PACKAGE:|" |
    paste -sd ',' -
