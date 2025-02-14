# dss-chain-log

An auth-managed on-chain changelog for the MCD system

## Usage

Contract Address: `0x060361951ada5365c06b7cb87d46b325747da10d`

* [Fxcore Testnet](https://testnet-explorer.functionx.io/evm/address/0x060361951aDa5365C06B7cB87D46B325747Da10D)


### Public functions

* `list()(bytes32[] memory)`: return all of the keys in the changelog
* `getAddress(bytes32)(address)`: for a given key, return the address
* `count()(uint256)`: return the number of keys in the changelog
* `get(uint256)(bytes32,address)`: return the key and address of an item in the array
* `version()(string)`: Returns a version for the changelog (if set)
* `wards(address)(uint256)`: 0 if address is not a ward, 1 if it is.

### Auth functions

* `rely(address)`/`deny(address)`: add and remove authorization
* `setAddress(bytes32,address)`: add or update a key/address pair
* `removeAddress(bytes32)`: remove a key (warning: this can shuffle the array)
* `setVersion(string memory)`: set the version of the current changelog

## Development

### Requirements

* [Dapptools](https://github.com/dapphub/dapptools)

### Testing

```
$ dapp update
$ make test
```


