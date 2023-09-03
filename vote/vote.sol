// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint public deposit;
    address[] public rsvps; // Changed array name to 'rsvps' and fixed the data type
    
    constructor(uint _deposit) {
        deposit = _deposit;
    }

    function rsvp() external payable {
        require(msg.value == deposit, "Wrong deposit"); // Check deposit amount
        
        for (uint i = 0; i < rsvps.length; i++) {
            require(rsvps[i] != msg.sender, "Already RSVP'd"); // Check if address has RSVP'd already
        }
        
        rsvps.push(msg.sender); // Store the address
        
    }
}

