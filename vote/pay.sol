// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint public deposit;
    address[] public rsvps;

    constructor(uint _deposit) {
        deposit = _deposit;
    }

function payBill(address venue, uint billCost) external {
    require(billCost <= address(this).balance, "Insufficient funds");

    uint remainingFunds = address(this).balance - billCost;
    uint payAmount = remainingFunds / rsvps.length;

    for (uint i = 0; i < rsvps.length; i++) {
        if (rsvps[i] != venue) {
            payable(rsvps[i]).transfer(payAmount);
        }
    }

    payable(venue).transfer(billCost);
}


    function rsvp() external payable {
        require(msg.value == deposit, "Wrong deposit");
        
        for (uint i = 0; i < rsvps.length; i++) {
            require(rsvps[i] != msg.sender, "Already RSVP'd");
        }
        
        rsvps.push(msg.sender);
    }
    
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

