// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// defining the IERC20 interface
interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract ADVault {
    // Declaring the token used in the vault, immutable to prevent changes after deployment
    IERC20 public immutable token;

    // Total supply of shares in the vault
    uint public totalSupply;
    
    // Mapping to store the balance of shares for each user
    mapping(address => uint) public balanceOf;

    // Mapping to track the rank for each user based on their daily usage streak
    mapping(address => uint) public rank;
    
    // Mapping to track the last time a user interacted with the daily streak function
    mapping(address => uint) public lastStreakCall;

    // Constructor to initialize the contract with my custom token address
    constructor(address _token) {
        token = IERC20(_token);
    }

    // Internal function to mint new shares to a user
    function _mint(address _to, uint _shares) private {
        totalSupply += _shares;            // Increase total supply by the amount of shares
        balanceOf[_to] += _shares;         // Increase the user's balance by the amount of shares
    }

    // Internal function to burn shares owned by a user
    function _burn(address _from, uint _shares) private {
        totalSupply -= _shares;            // Decrease total supply by the amount of shares
        balanceOf[_from] -= _shares;       // Decrease the user's balance by the amount of shares
    }

    // Function to allow users to deposit tokens and receive shares
    function deposit(uint _amount) external {
        uint shares;
        
        // Check if the user's rank is at least Bronze to allow deposit
        // my approach to ensuring share holders are those who consistently interact with the protocol
        if (rank[msg.sender] >= 100) {
            // If no shares exist, assign the amount of shares equal to the amount deposited
            if (totalSupply == 0) {
                shares = _amount;
            } else {
                // Calculate the shares proportionate to the amount deposited and the existing supply
                shares = (_amount * totalSupply) / token.balanceOf(address(this));
            }

            _mint(msg.sender, shares);     // Mint the calculated shares to the user
            token.transferFrom(msg.sender, address(this), _amount); // Transfer the native tokens from user to the contract
        }
    }

    // Function to allow users to withdraw their tokens by burning shares
    function withdraw(uint _shares) external {
        // Calculate the amount of tokens to withdraw based on the user's shares
        uint amount = (_shares * token.balanceOf(address(this))) / totalSupply;
        
        _burn(msg.sender, _shares);       // Burn the shares from the user
        token.transfer(msg.sender, amount); // Transfer the equivalent amount of tokens back to the user
    }

    // Function to allow users to increase their rank by calling once every 12 hours
    function dailyStreak() external {
        // Ensure the function is called only once every 12 hours per user
        require(block.timestamp >= lastStreakCall[msg.sender] + 12 hours, "You can only call this function once every 12 hours");

        rank[msg.sender] += 10;  // Increment the rank for the specific user
        lastStreakCall[msg.sender] = block.timestamp; // Update the timestamp for the last streak call

        // Credit 3 unit of ADTKN to the caller
        require(token.transfer(msg.sender, 3), "Token transfer failed");
    }

    // Function to check the rank of the caller
    function myRank() external view returns (string memory) {
        uint userRank = rank[msg.sender];
        
        // Return a rank based on the user's rank points
        if (userRank > 1000) {
            return "Gold";
        } else if (userRank > 500) {
            return "Silver";
        } else if (userRank > 100) {
            return "Bronze";
        } else {
            return "No Rank";
        }
    }
}
