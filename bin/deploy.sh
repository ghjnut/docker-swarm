#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

STACK_NAME="${1}"

echo "Deploying stack: ${STACK_NAME}"

pushd "stacks/${STACK_NAME}"
docker stack deploy -c <(docker-compose -f docker-stack.yml config) --prune "${STACK_NAME}"
popd
