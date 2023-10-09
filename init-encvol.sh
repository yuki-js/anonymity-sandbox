#!/bin/bash

echo "setup with: encfs /encdrv/encrypted /encdrv/decrypted"

docker run -it -u 1000 --rm \
  --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined \
  -v $PWD/.volume:/encdrv \
  --name init-encvol \
  --entrypoint /bin/bash \
  ghcr.io/yuki-js/anonymity-sandbox/encryptor:latest
