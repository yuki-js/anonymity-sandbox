# Anonymity Sandbox on Docker

## Introduction

The fastest way to get Tor sandbox with the power of containers.

## How to use

### Prerequisites

- Docker
- Docker Compose
- gocryptfs (optional)

### Run

```bash
./run.sh
```

After firefox is started, go to Firefox settings and set proxy to socks5://tor:9050 and DoH 1.1.1.1

### Stop

```bash
./run.sh down -v
```

## How it works

### Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications.

### Docker Compose file

`docker-compose.yml` defines the services that make up the sandbox.

### Services

#### tor

Tor is an open source implementation of the third generation onion routing that provides free access to an anonymous proxy network.

#### workspace

Workspace is a container that runs Firefox. Network external traffic is prohibited by Docker. All traffic must go through Tor.
