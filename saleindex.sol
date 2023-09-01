// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    uint public price;
    uint public saleTimestamp;

    event Deployed(address indexed owner);
    event Transfer(address indexed originalOwner, address indexed newOwner);
    event ForSale(uint price, uint timestamp);
    event Purchase(uint indexed amount, address indexed buyer);  // Updated event

    constructor() {
        owner = msg.sender;
        emit Deployed(owner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier forSale() {
        require(price > 0 && saleTimestamp > 0, "Collectible is not for sale");
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

    function purchase() external payable forSale {
        require(msg.value == price, "Sent value does not match the price");
        
        address buyer = msg.sender;
        address payable seller = payable(owner);
        uint amount = msg.value;

        owner = buyer;
        price = 0;
        saleTimestamp = 0;

        (bool success, ) = seller.call{ value: amount }("");
        require(success, "Transfer to seller failed");

        emit Transfer(owner, buyer);
        emit Purchase(amount, buyer);
    }
}

