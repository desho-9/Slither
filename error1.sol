// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Example {
    uint private balance;

    // Safely add funds
    function addFunds(uint _amount) public onlyPositive(_amount) {
        balance += _amount;
    }

    // Modifier to ensure only positive values are added
    modifier onlyPositive(uint _amount) {
        require(_amount > 0, "Amount must be positive");
        _;
    }

    // Safely withdraw funds
    function withdraw(uint _amount) public onlyPositive(_amount) {
        require(balance >= _amount, "Insufficient balance");
        balance -= _amount;
    }
}
