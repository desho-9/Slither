// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CriticalVisibility {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public {
        owner = newOwner;
    }
}
