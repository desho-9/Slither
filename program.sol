/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint256 private storedData; // Variable to store the data

    function set(uint256 x) public { storedData = x; } // Function to set the data
    function get() public view returns (uint256) { return storedData; } // Function to get the data
}
