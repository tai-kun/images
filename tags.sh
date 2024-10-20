#!/usr/bin/env bash

set -euo pipefail

echo "$CSV_LIST" |
    tr ',' '\n' |
    sed 's/^[ \t]*//;s/[ \t]*$//' |
    grep -v '^$' | sed "s|^|ghcr.io/$REPO_OWNER/surrealdb:|" |
    paste -sd ',' -
