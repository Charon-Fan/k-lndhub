#!/usr/bin/env bash

# exit from script if error was raised.
set -e

# Set default variables if needed.
DEBUG="debug"
NETWORK="mainnet"
CHAIN="bitcoin"
BACKEND="btcd"
RPCCRTPATH="/rpc/rpc.cert"
RPCHOST="blockchain"
RPCUSER="devuser"
RPCPASS="devpass"

exec lnd \
    --noseedbackup \
    "--$CHAIN.active" \
    "--$CHAIN.$NETWORK" \
    "--$CHAIN.node"="$BACKEND" \
    "--$BACKEND.rpccert"="$RPCCRTPATH" \
    "--$BACKEND.rpchost"="$RPCHOST" \
    "--$BACKEND.rpcuser"="$RPCUSER" \
    "--$BACKEND.rpcpass"="$RPCPASS" \
    "--rpclisten=0.0.0.0:10009" \
    --debuglevel="$DEBUG" \
    "$@"