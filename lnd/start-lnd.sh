#!/usr/bin/env bash

# exit from script if error was raised.
set -e

# Set default variables if needed.
DEBUG="debug"
NETWORK="testnet"
CHAIN="bitcoin"
BACKEND="btcd"
RPCCRTPATH="/rpc/rpc.cert"
RPCHOST="blockchain"
RPCUSER="devuser"
RPCPASS="devpass"

# Change permissions of the macaroon and tls.cert files
# chmod 644 /root/.lnd/data/chain/bitcoin/testnet/admin.macaroon
# chmod 644 /root/.lnd/tls.cert

exec lnd \
    --noseedbackup \
    "--$CHAIN.active" \
    "--$CHAIN.$NETWORK" \
    "--$CHAIN.node"="$BACKEND" \
    "--$BACKEND.rpccert"="$RPCCRTPATH" \
    "--$BACKEND.rpchost"="$RPCHOST" \
    "--$BACKEND.rpcuser"="$RPCUSER" \
    "--$BACKEND.rpcpass"="$RPCPASS" \
    "--rpclisten=$HOSTNAME:10009" \
    "--rpclisten=localhost:10009" \
    "--rpclisten=localhost:10009" \
    --debuglevel="$DEBUG" \
    "$@"