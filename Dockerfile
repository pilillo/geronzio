# https://gitlab.alpinelinux.org/alpine/aports/-/issues/10977
ARG VERSION=3.13
FROM alpine:${VERSION}

RUN apk update && apk add --no-cache krb5 kstart

