# Encrypting data in containers

FUSE requires SYS_ADMIN capability to mount filesystems inside containers, which potentially allows container escape.

You need to run the encryption system outside of the container, and bind mount the encrypted filesystem inside the container.

## How to encrypt a filesystem

I suggest using gocryptfs. It is newer, faster, easier, and more secure FUSE filesystem.

### Change security configuration

Add user_allow_other option on /etc/fuse.conf to allow access to FUSE devices from other users

```bash
sudo sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf
```

### Create a filesystem

```bash
mkdir -p .volume/encrypted .volume/decrypted
gocryptfs -init .volume/encrypted
# type password here twice
```

### Using the filesystem in a container

`02-encrypted-vol.yml` bind mounts `.volume/decrypted` into `/home/user/encrypted-volume` inside the container.

Before running the container, you need to mount the encrypted filesystem in the host:

```bash
gocryptfs .volume/encrypted .volume/decrypted -allow_other
# type password here
```

Then you can run the container.
By default, `run.sh` will load `02-encrypted-vol.yml`.

```bash
./run.sh
```

Then point the decrypted filesystem as the Firefox profile directory via Profile Manager.

Now you can use the encrypted filesystem in the container. Enjoy!
