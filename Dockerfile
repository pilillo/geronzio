ARG VERSION=3.12.4
FROM alpine:${VERSION}

RUN apk add --no-cache krb5
