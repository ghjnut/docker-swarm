# Easy-RSA Certs (self-signed)
[setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04)
## Overview

Currently used for generating an internal cert to use for SSL

NOTES:
- Firefox and Chrome didn't accept these certs at time of writing https://security.stackexchange.com/questions/269725/what-is-the-current-april-2023-browser-support-for-ed25519-certificate-signatu

### Generate Certificate Authority (Easy-RSA)

	# Setup create PKI
	docker build -t ghjnut/easy-rsa .

	docker volume create easy-rsa_pki

### Copy vars.example

	id=$(docker create image-name)
	docker cp $id:/usr/share/easy-rsa/vars.example ./config/
	docker rm -v $id

## import cert authority
(https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04)

## BOOTSTRAP

## INIT PKI
produces:
- `pki/`
- `pki/private`
- `pki/reqs`
- `pki/inline`
- `pki/openssl-easyrsa.cnf`

	# container
		docker run --rm -it ghjnut/easy-rsa ... init-pki

	# alpine container
		apk update
		apk add easy-rsa
		mkdir ~/easy-rsa
		ln -s /usr/share/easy-rsa/* ~/easy-rsa/
		cd ~/easy-rsa
		./easyrsa init-pki

## BUILD CA
config:
- `/usr/share/easy-rsa/vars`
produces:
- `pki/private/ca.key`
- `pki/issued`
- `pki/certs_by_serial`
- `pki/revoked`
- `pki/revoked/certs_by_serial`
- `pki/revoked/private_by_serial`
- `pki/revoked/reqs_by_serial`
- `pki/index.txt`
- `pki/index.txt.attr`
- `pki/serial`
- `pki/ca.crt`

		# host
		docker cp ~/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa/config/vars easyrsa:/usr/share/easy-rsa/vars

		# alpine
		ln -s /usr/share/easy-rsa/* ~/easy-rsa/
		./easyrsa build-ca
		# hit 'enter' for default

## COPY OUT CA CERT

	#docker cp easyrsa:/root/easy-rsa/pki/ca.crt ~/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa/config/
	docker cp easyrsa:/etc/easy-rsa/pki/ca.crt ./stacks/easy-rsa/config/

## (TRAEFIK) TRAEFIK: CREATE PRIVATE KEY
produces:
- `traefik-private.key`

		# ed25519
		openssl genpkey -algorithm ed25519 -out traefik-private.key

		# RSA?
		openssl genrsa -out traefik-private.key

		# RSA
		openssl genpkey -algorithm rsa -out traefik-private.key

## (OPTIONAL) TRAEFIK: CREATE PUBLIC KEY
produces:
- `traefik-private.pub`

		# generate public key
		openssl pkey -in traefik-private.key -pubout -out traefik-private.pub

## CREATE SIGNING REQUEST
- (https://jimfrenette.com/2018/03/ssl-certificate-authority-for-docker-and-traefik/)
requires:
- `traefik-private.csr.cnf`
produces:
- `traefik-private.req`

	# CURRENT
	openssl req -new -key traefik-private.key -out traefik-private.req -config traefik-private.conf

	# OLD (creates private key)
	openssl req -new -sha512 -nodes -out traefik-private.csr -newkey rsa:2048 -keyout traefik-private.key -config traefik-private.csr.cnf

## SIGN REQUEST
`traefik-private.crt`

	# host
	docker cp ~/src/github.com/ghjnut/docker-swarm/stacks/traefik-private/config/certs/traefik-private.csr easyrsa:/tmp

	# alpine
	easyrsa import-req /tmp/traefik-private.req traefik-private
	easyrsa sign-req server traefik-private

	# host
	[ghjnut@derek docker-swarm]$ docker cp easyrsa:/etc/easy-rsa/pki/issued/traefik-private.crt ./stacks/traefik-private/config/certs.new/

## ADD TO TRAEFIK

	# host
	# TODO: needed?
	#scp stacks/easy-rsa/config/ca.crt hansel.jaked.in:/tmp

	scp stacks/traefik-private/config/certs/traefik-private.key hansel.jaked.in:/tmp
	scp stacks/traefik-private/config/certs/traefik-private.crt hansel.jaked.in:/tmp

	# hansel.jaked.in
	docker ps |grep traefik-private
	docker cp /tmp/traefik-private.key 256ae79ad6f3:/certs
	docker cp /tmp/traefik-private.crt 256ae79ad6f3:/certs
