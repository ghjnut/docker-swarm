FROM alpine:3.14
RUN apk add --no-cache easy-rsa

RUN mkdir ~/easy-rsa && \
  ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
  chmod 700 ~/easy-rsa

WORKDIR /root/easy-rsa

RUN ./easyrsa init-pki

ENTRYPOINT ["mysql"]
