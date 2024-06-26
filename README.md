# MyToken Project

MyToken is an ERC20 token contract deployed on the Ethereum blockchain, featuring minting, transferring, and burning functionalities.

## Description

MyToken is an ERC20 token smart contract written in Solidity. It inherits from OpenZeppelin's `ERC20` and `Ownable` contracts, providing standard token functionality and access control for token minting and burning.

## Contract Features

- **Minting Tokens:** Only the contract owner can mint new tokens.
- **Transferring Tokens:** Any user can transfer tokens to another address.
- **Burning Tokens:** Any user can burn (destroy) their own tokens.

## Getting Started

### Installing

Clone the repository to your local machine:
```bash
git clone https://github.com/your-username/MyToken.git
```

### Executing Program

1. Navigate to the project directory:
```bash
cd MyToken
```

2. Install dependencies:
```bash
npm install
```

3. Compile the contracts:
```bash
npx hardhat compile
```

4. Deploy the contract on a test network (Rinkeby in this example):
```bash
npx hardhat run scripts/deploy.js --network rinkeby
```

5. Interact with the deployed contract using Hardhat console or Remix IDE.

## Help

For any issues or questions, please contact [asrmanalo@mymail.mapua.edu.ph](mailto:asrmanalo@mymail.mapua.edu.ph).

## Authors

- Ashley Manalo - [qeewpi](https://github.com/qeewpi)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contract Details

### MyToken Contract

The `MyToken` contract is an ERC20 token with additional functionalities:

- **Constructor:** Initializes the contract with the specified initial owner.
- **Minting:** Allows the owner to mint new tokens.
- **Burning:** Allows any account holder to burn their own tokens.
- **Ownership:** Inherits from `Ownable.sol`, ensuring only the owner can perform certain actions.

For detailed code, see [`contracts/MyToken.sol`](contracts/MyToken.sol).
