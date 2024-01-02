FROM alpine:3.19

RUN apk add --no-cache easy-rsa && \
	ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin

WORKDIR /root/easy-rsa

RUN ln -s /usr/share/easy-rsa/* ./ && \
	chmod 700 .

VOLUME /root/easy-rsa/pki

ENTRYPOINT [ "easyrsa" ]
