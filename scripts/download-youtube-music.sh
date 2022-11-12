#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 2 ]
then echo "args less than 1"
fi

MUISC_LINK=$1

printf "Download music from %s"  ${MUISC_LINK}
