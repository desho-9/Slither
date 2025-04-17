// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract VulnerableContract {
    mapping(address => uint256) public balances;

    // Deposit funds
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw funds (vulnerable to reentrancy)
    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // External call before state update (Reentrancy vulnerability)
        (bool success, ) = msg.sender.call{value: _amount}("");  // External call with tainted data
        require(success, "Transfer failed");

        // Update state after the external call
        balances[msg.sender] -= _amount;
    }
}
