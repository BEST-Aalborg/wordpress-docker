#!/usr/bin/env bash
# ex: set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab:

set -eu

[ -n "${DEBUG_BASH:-}" ] && set -xv

WEBSITE='https://best.aau.dk'


fail_count=0
while true; do
    http_code=$(curl --write-out '%{http_code}' --output /dev/null --silent --show-error "${WEBSITE}")

    if [ "${http_code}" != '200' ]; then
        fail_count=$(expr ${fail_count} + 1)
        echo "Failed to connect to WordPress (count ${fail_count})"
    fi
done

