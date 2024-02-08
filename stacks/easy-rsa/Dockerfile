FROM alpine:3.19

RUN apk add --no-cache easy-rsa && \
	ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin

WORKDIR /root

ENV EASYRSA=/etc/easy-rsa

VOLUME /etc/easy-rsa/pki

ENTRYPOINT [ "easyrsa" ]
