// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ADTKN {
    // Total supply of the token
    uint public totalSupply;

    // Mapping to track the balance of each account
    mapping(address => uint) public balanceOf;

    // Mapping to track the allowance a spender is allowed to withdraw from an owner's account
    mapping(address => mapping(address => uint)) public allowance;

    // Name of the token
    string public name = "Vault Token";
    
    // Symbol of the token
    string public symbol = "VTK";
    
    // Number of decimals the token uses (typically 18 for ERC20 tokens)
    uint8 public decimals = 18;

    // Event emitted when tokens are transferred from one account to another
    event Transfer(address indexed from, address indexed to, uint value);
    
    // Event emitted when an approval is made for a spender to use tokens on behalf of the owner
    event Approval(address indexed owner, address indexed spender, uint value);

    // Function to transfer tokens to another account
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;  // Decrease the balance of the sender
        balanceOf[recipient] += amount;   // Increase the balance of the recipient
        emit Transfer(msg.sender, recipient, amount);  // Emit a Transfer event
        return true;
    }

    // Function to approve a spender to withdraw tokens from the sender's account
    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;  // Set the allowance for the spender
        emit Approval(msg.sender, spender, amount);  // Emit an Approval event
        return true;
    }

    // Function to transfer tokens from one account to another using an allowance
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;  // Decrease the allowed amount
        balanceOf[sender] -= amount;  // Decrease the balance of the sender
        balanceOf[recipient] += amount;  // Increase the balance of the recipient
        emit Transfer(sender, recipient, amount);  // Emit a Transfer event
        return true;
    }

    // Function to mint new tokens and add them to the sender's balance
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;  // Increase the balance of the sender
        totalSupply += amount;  // Increase the total supply of tokens
        emit Transfer(address(0), msg.sender, amount);  // Emit a Transfer event from the zero address (minting)
    }

    // Function to burn tokens, removing them from the sender's balance
    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;  // Decrease the balance of the sender
        totalSupply -= amount;  // Decrease the total supply of tokens
        emit Transfer(msg.sender, address(0), amount);  // Emit a Transfer event to the zero address (burning)
    }
}