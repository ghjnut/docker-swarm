# vi: ft=bash
#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

docker build -t ghjnut/easy-rsa .
