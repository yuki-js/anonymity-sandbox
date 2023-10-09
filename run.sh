#!/bin/sh

docker compose -f stacks/00-base.yml -f stacks/01-tor.yml ${@:-up -d}

echo "After firefox is started, go to settings and set proxy to socks5://tor:9050 and DoH 1.1.1.1"