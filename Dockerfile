FROM alpine:latest

ENV MEOW_INSTALLDIR=/meow

RUN mkdir /meow && \
    mkdir /lib64 && \
    apk add --no-cache libc6-compat curl && \
    cp /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 && \
    curl -L git.io/meowproxy | sh

WORKDIR /meow
ENTRYPOINT /meow/MEOW
# should mount your config at /root/.meow/rc
