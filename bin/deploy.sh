#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

STACK_NAME="${1}"

echo "Deploying stack: ${STACK_NAME}"
pushd "stacks/${STACK_NAME}"

set -o allexport
source .env
set +o allexport
#docker stack config --compose-file docker-stack.yml
docker stack deploy --compose-file <(docker stack config --compose-file docker-stack.yml) --prune "${STACK_NAME}"
popd
