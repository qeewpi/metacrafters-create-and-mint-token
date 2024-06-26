// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("MyToken", "MTK") Ownable(initialOwner) {
        // Pass the initial owner address to the Ownable constructor.
    }
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address account, uint256 amount) public {
        require(account == msg.sender || isOwner(), "MyToken: caller is not owner or account holder");
        _burn(account, amount);
    }

    function isOwner() internal view returns (bool) {
        return owner() == _msgSender();
    }
}