// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TxOriginExample {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw() external {
        require(tx.origin == owner, "Not authorized");
        payable(msg.sender).transfer(address(this).balance);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}
