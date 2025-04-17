pragma solidity ^0.8.28;

contract BlockNumberAccess {
    uint256 public value;
    
    modifier onlyAtBlock(uint256 blockNumber) {
        require(block.number == blockNumber, "Not the correct block");
        _;
    }

    function setValue(uint256 _value) public onlyAtBlock(1000000) {
        value = _value;
    }
}


