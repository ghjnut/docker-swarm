build_volume_container() {
	docker run \
		--name "$OVPN_DATA_CONTAINER" \
		--volume /etc/openvpn \
		busybox
}

# Generate config
generate_config() {
	docker run --volumes-from "$OVPN_DATA_CONTAINER" \
		--rm \
		"$OVPN_SERVER_IMAGE" \
		ovpn_genconfig \
		-u udp://"$OVPN_DOMAIN"

	docker run --volumes-from "$OVPN_DATA_CONTAINER" \
		--rm --interactive --tty \
		"$OVPN_SERVER_IMAGE" \
		ovpn_initpki
}

generate_cert() {
	local client_name="$1"

	docker run \
		--rm \
		--interactive --tty \
		--volumes-from "$OVPN_DATA_CONTAINER" \
		"$OVPN_SERVER_IMAGE" \
		easyrsa build-client-full "$client_name" nopass

	docker run \
		--rm \
		--volumes-from "$OVPN_DATA_CONTAINER" \
		"$OVPN_SERVER_IMAGE" \
		ovpn_getclient "$client_name" > "$client_name".ovpn
}

start_server_container() {
	docker run \
		--detach \
		--volumes-from "$OVPN_DATA_CONTAINER" \
		--publish "$OVPN_PORT":1194/udp \
		--cap-add=NET_ADMIN \
		--name "$OVPN_SERVER_CONTAINER" \
		"$OVPN_SERVER_IMAGE"
}
