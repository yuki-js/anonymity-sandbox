FROM alpine:latest

EXPOSE 9050 9051 5353
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache tor nyx


RUN adduser -D tor
USER tor

WORKDIR /home/tor
COPY --chown=tor:tor launch.sh /home/tor/launch.sh
RUN chmod +x /home/tor/launch.sh

CMD ["/home/tor/launch.sh"]