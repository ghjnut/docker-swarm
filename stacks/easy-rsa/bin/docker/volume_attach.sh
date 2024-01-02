# vi: ft=bash
#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

docker run --rm -it \
	--entrypoint sh \
	--volume easy-rsa_pki:/root/easy-rsa/pki \
	ghjnut/easy-rsa
