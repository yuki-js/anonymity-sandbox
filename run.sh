#!/bin/sh

if [ ! -f .volume/decrypted/.keep ]; then
  echo "Volume is not decrypted, decrypting..."
  gocryptfs .volume/encrypted .volume/decrypted -allow_other && touch .volume/decrypted/.keep || exit 1
fi

docker compose -f stacks/00-base.yml -f stacks/01-tor.yml -f stacks/02-encrypted-vol.yml ${@:-up -d}
