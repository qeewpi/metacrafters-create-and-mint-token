// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // Constructor to set the initial owner of the contract
    constructor(address initialOwner) ERC20("MyToken", "MTK") {
        transferOwnership(initialOwner); // Set the initial owner
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

    // Function to approve another account to spend tokens on behalf of the caller
    function approveTokens(address spender, uint256 amount) public {
        // Approve the spender to spend the specified amount
        bool success = approve(spender, amount);
        require(success, "Approval failed");
    }

    // Function to transfer tokens from one account to another on behalf of the owner
    function transferTokensFrom(address sender, address recipient, uint256 amount) public {
        // Transfer tokens from the sender's account to the recipient using the allowance mechanism
        bool success = transferFrom(sender, recipient, amount);
        require(success, "TransferFrom failed");
    }

    // Internal function to check if the caller is the owner
    function isOwner() internal view returns (bool) {
        return owner() == _msgSender();
    }
}
