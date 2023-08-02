#!/usr/bin/env bash

# exit from script if error was raised.
set -e

# Set default variables if needed.
DEBUG="debug"
NETWORK="testnet"
CHAIN="bitcoin"
BACKEND="neutrino"

# Change permissions of the macaroon and tls.cert files
chmod 644 /root/.lnd/data/chain/bitcoin/testnet/admin.macaroon
chmod 644 /root/.lnd/tls.cert

exec lnd \
    "--$CHAIN.active" \
    "--$CHAIN.$NETWORK" \
    "--$CHAIN.node"="$BACKEND" \
    "--$BACKEND.connect=faucet.lightning.community" \
    "--rpclisten=localhost:10009" \
    --debuglevel="$DEBUG" \
    "$@"