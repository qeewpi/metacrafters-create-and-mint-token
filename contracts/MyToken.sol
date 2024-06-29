// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // Constructor to set the initial owner of the contract
    constructor(address initialOwner) ERC20("MyToken", "MTK") Ownable(initialOwner) {
        // Pass the initial owner address to the Ownable constructor.
    }
    
    // Function to mint new tokens, only callable by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from a specific account
    function burn(address account, uint256 amount) public {
        require(account == msg.sender || isOwner(), "MyToken: caller is not owner or account holder");
        _burn(account, amount);
    }

    // Function to transfer tokens to a specific address
    function transferTokens(address recipient, uint256 amount) public {
        // Transfer tokens from the caller's account to the recipient
        bool success = transfer(recipient, amount);
        require(success, "Transfer failed");
    }

    // Internal function to check if the caller is the owner
    function isOwner() internal view returns (bool) {
        return owner() == _msgSender();
    }
}
