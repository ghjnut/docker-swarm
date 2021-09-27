[setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04)

# import cert authority
(https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04)

    sudo cp /tmp/ca.crt /usr/local/share/ca-certificates/
    sudo update-ca-certificates


## BOOTSTRAP

    docker run --rm -it --name easyrsa alpine:3.14 sh

    cd ~/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa


## INIT PKI

    # alpine
    apk update
    apk add easy-rsa
    mkdir ~/easy-rsa
    ln -s /usr/share/easy-rsa/* ~/easy-rsa/
    cd ~/easy-rsa
    ./easyrsa init-pki

## BUILD CA
`ca.crt`

    # host
    docker cp ~/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa/config/vars easyrsa:/usr/share/easy-rsa/vars
    # alpine
    ln -s /usr/share/easy-rsa/* ~/easy-rsa/
    ./easyrsa build-ca
    # hit 'enter' for default

## COPY OUT

    # host
    docker cp easyrsa:/root/easy-rsa/pki/ca.crt ~/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa/config/


## CREATE PRIVATE KEY
`traefik-private.key`

    cd ~/src/github.com/ghjnut/docker-swarm/stacks/traefik-private
    openssl genrsa -out config/certs/traefik-private.key

## CREATE SIGNING REQUEST
[https://jimfrenette.com/2018/03/ssl-certificate-authority-for-docker-and-traefik/](TLS guide)

`traefik-private.csr`
`traefik-private.key`

    #OLD
    # fill in with matching easy rsa vars
    # CN = internal.jaked.in
    #openssl req -new -key config/certs/traefik-private.key -out config/certs/traefik-private.req

    openssl req -new -sha512 -nodes -out config/certs/traefik-private.csr -newkey rsa:2048 -keyout config/certs/traefik-private.key -config <( cat config/certs/traefik-private.csr.cnf )

## SIGN REQUEST
`traefik-private.crt`

    # host
    docker cp ~/src/github.com/ghjnut/docker-swarm/stacks/traefik-private/config/certs/traefik-private.csr easyrsa:/tmp
    # alpine
    ./easyrsa import-req /tmp/traefik-private.csr traefik-private
    ./easyrsa sign-req server traefik-private
    # host
    docker cp easyrsa:/root/easy-rsa/pki/issued/traefik-private.crt ~/src/github.com/ghjnut/docker-swarm/stacks/traefik-private/config/certs/traefik-private.crt

## ADD TO TRAEFIK

    # host
    scp /home/ghjnut/src/github.com/ghjnut/docker-swarm/stacks/easy-rsa/config/ca.crt hansel.jaked.in:~/certs
    scp /home/ghjnut/src/github.com/ghjnut/docker-swarm/stacks/traefik-private/config/certs/traefik-private.key hansel.jaked.in:~/certs
    scp /home/ghjnut/src/github.com/ghjnut/docker-swarm/stacks/traefik-private/config/certs/traefik-private.crt hansel.jaked.in:~/certs
    # hansel.jaked.in
    docker cp ~/certs 8bf06798e012:/
