// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    uint public price;
    uint public saleTimestamp;

    event Deployed(address indexed owner);
    event Transfer(address indexed originalOwner, address indexed newOwner);
    event ForSale(uint price, uint timestamp);

    constructor() {
        owner = msg.sender;
        emit Deployed(owner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function transfer(address recipient) external onlyOwner {
        require(recipient != address(0), "Invalid recipient address");
        address originalOwner = owner;
        owner = recipient;
        emit Transfer(originalOwner, recipient);
    }

    function markPrice(uint askingPrice) external onlyOwner {
        price = askingPrice;
        saleTimestamp = block.timestamp;
        emit ForSale(price, saleTimestamp);
    }
}

