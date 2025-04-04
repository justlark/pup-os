#!/usr/bin/env bash

set -euo pipefail

if command -v nu &>/dev/null; then
    exec nu ./gnome-backgrounds.nu "$@"
else
    echo "Error: Nushell not found." >&2
    exit 1
fi

