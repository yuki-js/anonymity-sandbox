#!/bin/sh

docker compose -f stacks/00-base.yml -f stacks/01-tor.yml -f stacks/02-encrypted-vol.yml ${@:-up -d}
