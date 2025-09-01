# COIL Token

An ERC20 token contract designed for a community local economy, enabling anonymous mobile payments and community organizing.

## Features

- **Capped Supply**: 1 billion tokens maximum
- **Role-Based Access Control**: 
  - `MINTER_ROLE`: Can mint tokens for orgs and governance
  - `PAUSER_ROLE`: Can pause/unpause all token operations
  - `COUPON_CREATOR_ROLE`: Can create and manage redemption coupons
  - `WELCOME_BONUS_DISTRIBUTOR_ROLE`: Can distribute welcome bonuses to new users (the app's backend)
- **Pausable**: Emergency stop functionality affecting all token operations
- **Welcome Bonus System**: 101 tokens per new user
- **Coupon Redemption**: String-based coupon codes for token distribution
- **Allocation Tracking**: Separate allocations for different distribution types

## Token Allocations

- **Welcome Bonus**: 300,000,000 tokens (101 tokens per user)
- **Organizations**: 200,000,000 tokens
- **Governance**: 500,000,000 tokens
- **Total**: 1,000,000,000 tokens (100% of cap)

## Core Functions

### Distribution Functions
- `distributeWelcomeBonus(address to)`: Distribute 101 tokens to new users
- `distributeOrgs(address to, uint256 amount)`: Distribute tokens to protest organizations
- `distributeGovernance(address to, uint256 amount)`: Distribute governance tokens

### Coupon System
- `updateCoupon(string couponCode, uint256 amount)`: Create, delete or update coupon redemption amounts
- `redeem(string couponCode)`: Redeem coupon code for tokens
- `hasRedeemedCoupon(string couponCode, address user)`: Check if user has redeemed coupon

### Administration
- `pause()` / `unpause()`: Emergency controls
- Role management via OpenZeppelin AccessControl

### View Functions
- `getRemainingWelcomeBonusAllocation()`: Check remaining welcome bonus allocation
- `getRemainingProtestOrgsAllocation()`: Check remaining protest org allocation
- `getRemainingGovernanceAllocation()`: Check remaining governance allocation


## Requirements

Foundry v1.0+ required for Prague EVM support.

```shell
foundryup
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

## Deployment

### Setup Environment
```shell
cp .env.example .env
```

Fill in your values in `.env`:
- `CELO_RPC_URL`: RPC endpoint
- `DEPLOYER_PRIVATE_KEY`: Deployer wallet private key (with 0x prefix)
- `OWNER_ADDRESS`: Address that will receive admin roles
- `WELCOME_BONUS_DISTRIBUTOR_ADDRESS`: Address for welcome bonus distributor role

### Deploy
```shell
source .env && forge script script/Deploy.s.sol --rpc-url $CELO_RPC_URL --broadcast
```

### Verify Contract
```shell
forge verify-contract \
  --rpc-url $CELO_RPC_URL \
  --verifier blockscout \
  --verifier-url 'https://blockscout-url/api/' \
  <DEPLOYED_ADDRESS> \
  src/COIL.sol:COIL \
  --constructor-args $(cast abi-encode "constructor(address,address)" <OWNER_ADDRESS> <WELCOME_BONUS_DISTRIBUTOR_ADDRESS>)
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
