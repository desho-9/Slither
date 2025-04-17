// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract VulnerableBank {
    mapping(address => uint256) public balances;

    // Deposit function to add funds to the user's balance
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw function that is vulnerable to reentrancy
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Call to external contract (potentially malicious) before updating balance
     //   (bool success, ) = msg.sender.call{value: amount}("");
      //  require(success, "Transfer failed");

        // Update the balance after the transfer
        balances[msg.sender] -= amount;
    }
}
