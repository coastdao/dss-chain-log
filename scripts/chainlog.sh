#!/usr/bin/env bash
### chainlog -- list keys in ascii and addresses from the ChainLog
### Usage:
### ./chainlog.sh list all entry-values in the chainlog
### ./chainlog.sh <entry> return the entry's address
set -e

[[ "$ETH_RPC_URL" ]] || { echo "Please set a ETH_RPC_URL"; exit 1; }

CHANGELOG=0x060361951ada5365c06b7cb87d46b325747da10d

echo -e "Network: $(seth chain)"
if [[ -z $1 ]];
then
    list=$(seth call "$CHANGELOG" 'list()(bytes32[])')
    IFS=","
    for key in $list
    do
        seth --to-ascii "$key"
        seth call "$CHANGELOG" 'getAddress(bytes32)(address)' "$key"
    done

else
    seth call "$CHANGELOG" 'getAddress(bytes32)(address)' "$(seth --to-bytes32 "$(seth --from-ascii "$1")")"
fi
