#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

STACK_NAME="${1}"

echo "Showing config for stack: ${STACK_NAME}"

pushd "stacks/${STACK_NAME}"
docker stack config --compose-file docker-stack.yml
popd
