// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Switch {
    address payable receiptOfFunds;
    address owner;
    uint256 lastActivity;

    constructor(address payable addr) payable {
        owner = msg.sender;
        receiptOfFunds = addr;
        lastActivity = block.timestamp;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function withdraw() external {
        require((block.timestamp - lastActivity) >= (52 weeks), "Too soon");
        receiptOfFunds.transfer(address(this).balance);
    }

    function ping() external isOwner {
        lastActivity = block.timestamp;
    }
}

