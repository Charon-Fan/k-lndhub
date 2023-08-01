# Btcsnap LndHub

Btcsnap LndHub is a Docker Compose project that sets up a Bitcoin environment with a Bitcoin Core (`btcd`), Lightning Network Daemon (`lnd`), Redis, and LNDHub server. It serves as a ready-to-use Bitcoin and Lightning Network infrastructure for developers and enthusiasts.

## Getting Started

Before you start, make sure Docker and Docker-Compose are installed on your system.

1. **Clone the Repository:**
    
    ```
    git clone https://github.com/KeystoneHQ/Btcsnap-LndHub.git
    cd Btcsnap-LndHub
    
    ```
    
2. **Configuration:**
    
    The Bitcoin network type (`mainnet`, `testnet`, `regtest`) can be configured via the `NETWORK` environment variable when running the Docker Compose command. For example, to use the testnet, run:

    ```
    NETWORK="testnet" docker-compose up
    
    ```
    

## Services

### btcd

`btcd` is the Bitcoin Core daemon. The container is built from a Dockerfile in the `btcd` directory. The RPC and data for `btcd` are stored in Docker volumes named `shared` and `bitcoin` respectively.

### lnd

`lnd` is the Lightning Network Daemon. The container is built from a Dockerfile in the `lnd` directory. It communicates with the `btcd` node and stores its data in a volume named `lnd`.

### redis

`redis` is a Redis server, used for caching data. The container uses the latest Redis image from Docker Hub and stores its data in a Docker volume named `redis_data`.

### lndhub

`lndhub` is a wrapper around `lnd`. It makes it easier to manage Lightning Network payments and invoices. The container is built from a Dockerfile in the `lndhub` directory. It communicates with the `lnd` and `redis` services and stores its data in a Docker volume named `lndhub`.

## Volumes

The following volumes are used to persist data:

- `bitcoin`: Stores `btcd` data.
- `shared`: Shared volume for RPC communication.
- `lnd`: Stores `lnd` data.
- `redis_data`: Stores data for the Redis server.
- `lndhub`: Stores `lndhub` data.

## License

This project is licensed under the terms of the MIT license.
