FROM alpine:latest

EXPOSE 9050 9051 5353
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache tor nyx
USER tor
CMD tor -f /etc/tor/torrc