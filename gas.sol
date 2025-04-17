// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract GasProblem {
    uint[] public numbers;

    // Adds a list of numbers to the contract's state
    function addNumbers(uint[] calldata newNumbers) external {
        for (uint i = 0; i < newNumbers.length; i++) {
            numbers.push(newNumbers[i]);
        }
    }
}
