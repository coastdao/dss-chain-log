#!/usr/bin/env bash
### keys2ascii -- list keys from the ChainLog in ascii
### Usage: ./keys2ascii.sh
set -e

[[ "$ETH_RPC_URL" ]] || { echo "Please set a ETH_RPC_URL"; exit 1; }

CHANGELOG=0x060361951ada5365c06b7cb87d46b325747da10ds

echo -e "Network: $(seth chain)"
list=$(seth call "$CHANGELOG" 'list()(bytes32[])')
IFS=","
for key in $list
do
    seth --to-ascii "$key"
done
